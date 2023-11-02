#!/bin/bash
source .env

# build the project
build() {
    output=$(scarb build 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi
}

# declare the contract
declare() {
    output=$(starkli declare $SIERRA_FILE --keystore-password $KEYSTORE_PASSWORD --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    address=$(echo "$output" | grep -oP '0x[0-9a-fA-F]+')
    echo $address
}

deploy_provider() {
    OWNER=$DEPLOYER_ADDRESS

    output=$(starkli deploy $PROVIDER_CLASS "$OWNER" --keystore-password $KEYSTORE_PASSWORD --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    address=$(echo "$output" | grep -oP '0x[0-9a-fA-F]+' | tail -n 1) 
    echo $address
}

add_component() {
    output=$(starkli invoke $PROVIDER_ADDRESS register $COMPONENT_CLASS --keystore-password $KEYSTORE_PASSWORD --watch 2>&1)

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
        component_classes+=( $class_hash )
    done
}

setup_provider() {
    contract=$(deploy_provider)
    PROVIDER_ADDRESS=$contract
    echo "Provider deployed at:"$PROVIDER_ADDRESS

    for class_hash in ${component_classes[@]};
    do
        COMPONENT_CLASS=$class_hash
        add_component
    done
}


declare_all() {
    # build
    SIERRA_FILE="./target/dev/compiled_ComponentProvider.sierra.json"
    class_hash=$(declare | tail -n 1)
    PROVIDER_CLASS=$class_hash
    echo "PROVIDER_CLASS="$PROVIDER_CLASS

    declare_components
}

make() {
    echo "Declaring all contracts"

    declare_all

    echo ${#component_classes[@]}" Components to register"
    echo "Waiting a minute.."

    sleep 60

    setup_provider
}

# make

SIERRA_FILE="./target/dev/compiled_metadata_components_component_logos_carbonable_Component.sierra.json"
class_hash=$(declare | tail -n 1)
echo $class_hash
