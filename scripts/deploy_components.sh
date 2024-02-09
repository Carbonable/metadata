#!/bin/bash
source .env

# Check if --debug parameter is passed
debug=0
declare=0
setup=0

TEMP=$(getopt -o cpd --long components,provider,debug -- "$@")

eval set -- "$TEMP"

while true ; do
    case "$1" in
        -c|--components)
            declare=1 ; shift ;;
        -p|--provider)
            setup=1 ; shift ;;
        -d|--debug)
            debug=1 ; shift ;;
        --) shift ; break ;;
        *) echo "Internal error!" ; exit 1 ;;
    esac
done

# build the project
build() {
    output=$(scarb build 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi
}

declare() {
    if [ $debug -eq 1 ]; then
        printf "starkli declare %s --keystore-password KEYSTORE_PASSWORD --rpc %s --watch \n" "$SIERRA_FILE" "$STARKNET_RPC" > ./scripts/debug_declare_components.log
    fi
    output=$(starkli declare $SIERRA_FILE --keystore-password $KEYSTORE_PASSWORD --rpc $STARKNET_RPC --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    address=$(echo "$output" | grep -oP '0x[0-9a-fA-F]+')
    echo $address
}

add_component() {
    if [ $debug -eq 1 ]; then
        printf "starkli invoke %s register %s --keystore-password KEYSTORE_PASSWORD --rpc %s --watch \n" "$PROVIDER_ADDRESS" $COMPONENT_CLASS "$STARKNET_RPC" >> ./scripts/debug_setup_provider.log
    fi
    output=$(starkli invoke $PROVIDER_ADDRESS register $COMPONENT_CLASS --keystore-password $KEYSTORE_PASSWORD --rpc $STARKNET_RPC --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    echo "Registering component: " $COMPONENT_CLASS
}

component_classes=();

# Declares all components
declare_components() {
    search_dir=./src/components/component
    for entry in "$search_dir"/**/*.cairo;
    do
        entry="${entry#./src/}"
        entry="${entry%.cairo}"
        entry=$(echo $entry | sed "s/\//_/g")
        entry="./target/dev/compiled_metadata_${entry}_Component.sierra.json"
        SIERRA_FILE=$entry
        echo "Declaring: " $SIERRA_FILE

        class_hash=$(declare | tail -n 1)
        echo "at" $class_hash
        component_classes+=( $class_hash )
    done
}

declare_all() {
    # build
    SIERRA_FILE="./target/dev/compiled_ComponentProvider.sierra.json"
    class_hash=$(declare | tail -n 1)
    PROVIDER_CLASS=$class_hash
    echo "PROVIDER_CLASS="$PROVIDER_CLASS

    echo "$PROVIDER_CLASS" > .tmp.addr.provider

    declare_components

    echo "${component_classes[@]}" > .tmp.addr.component_classes

    echo ${#component_classes[@]}" Components to register"
}

deploy_provider() {
    OWNER=$DEPLOYER_ADDRESS

    PROVIDER_CLASS=$(cat .tmp.addr.provider)
    printf "Logs : Provider class : %s \n" "$PROVIDER_CLASS" > ./scripts/debug_setup_provider.log
    
    if [ $debug -eq 1 ]; then
        printf "starkli deploy %s %s --keystore-password KEYSTORE_PASSWORD --rpc %s --watch \n" "$PROVIDER_CLASS" $OWNER "$STARKNET_RPC" >> ./scripts/debug_setup_provider.log
    fi
    output=$(starkli deploy $PROVIDER_CLASS "$OWNER" --keystore-password $KEYSTORE_PASSWORD --rpc $STARKNET_RPC --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    address=$(echo "$output" | grep -oP '0x[0-9a-fA-F]+' | tail -n 1) 
    echo $address
}

setup_provider() {
    contract=$(deploy_provider)
    PROVIDER_ADDRESS=$contract
    echo "Provider deployed at:"$PROVIDER_ADDRESS

    readarray -t component_classes < .tmp.addr.component_classes

    counter=0
    for class_hash in ${component_classes[@]};
    do
        COMPONENT_CLASS=$class_hash
        add_component
        ((counter++))
    done

    echo "Total components added: $counter"
}

if [ $declare -eq 1 ]; then
    declare_all
fi

if [ $setup -eq 1 ]; then
    setup_provider
fi