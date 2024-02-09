#!/bin/bash
source .env

# Check if --debug parameter is passed
debug=0
declare=0
build=0

TEMP=$(getopt -o cbd --long contracts,build,debug -- "$@")

eval set -- "$TEMP"

while true ; do
    case "$1" in
        -c|--contracts)
            declare=1 ; shift ;;
        -b|--provider)
            build=1 ; shift ;;
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

# declare a contract
declare() {
    output=$(starkli declare $SIERRA_FILE --keystore-password $KEYSTORE_PASSWORD --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    address=$(echo "$output" | grep -oP '0x[0-9a-fA-F]+')
    echo $address
}

BanegasFarm="./target/dev/compiled_BanegasFarmUri.sierra.json"
LasDelicias="./target/dev/compiled_LasDeliciasUri.sierra.json"
Manjarisoa="./target/dev/compiled_ManjarisoaUri.sierra.json"
Karathuru="./target/dev/compiled_KarathuruUri.sierra.json"
ERC3525Contract="./target/dev/compiled_ContractMetadata.sierra.json"
Jaguar="./target/dev/compiled_JaguarIpfsUri.sierra.json"
LoremIpsum="./target/dev/compiled_LoremIpsumUri.sierra.json"

BORDER="./target/dev/compiled_metadata_components_component_sft_border_v2_Component.sierra.json"

contracts=( $BanegasFarm $LasDelicias $Manjarisoa $Karathuru $ERC3525Contract )

declare_contracts() {
    for contract in ${contracts[@]};
    do
        SIERRA_FILE=$contract
        echo "Declaring: "$SIERRA_FILE;
        class_hash=$(declare | tail -n 1)
        echo "Declared at: "$class_hash
    done
}

if [ $declare -eq 1 ]; then
    declare_contracts
fi
if [ $build -eq 1 ]; then
    build
fi