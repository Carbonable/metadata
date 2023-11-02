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

# declare a contract
declare() {
    output=$(starkli declare $SIERRA_FILE --keystore-password $KEYSTORE_PASSWORD --watch 2>&1)

    if [[ $output == *"Error"* ]]; then
        echo "Error: $output"
        exit 1
    fi

    address=$(echo "$output" | grep -oP '0x[0-9a-fA-F]+ ')
    echo $address
}

BanegasFarm="./target/dev/compiled_BanegasFarmUri.sierra.json"
LasDelicias="./target/dev/compiled_LasDeliciasUri.sierra.json"
Manjarisoa="./target/dev/compiled_ManjarisoaUri.sierra.json"
ERC3525Contract="./target/dev/compiled_ContractMetadata.sierra.json"
Jaguar="./target/dev/compiled_JaguarIpfsUri.sierra.json"

BORDER="./target/dev/compiled_metadata_components_component_sft_border_v2_Component.sierra.json"

contracts=( $BanegasFarm $LasDelicias $Manjarisoa $ERC3525Contract )
#contracts=( $Jaguar )

declare_all() {
    for contract in ${contracts[@]};
    do
        SIERRA_FILE=$contract
        echo "Declaring: "$SIERRA_FILE;
        class_hash=$(declare | tail -n 1)
        echo "Declared at: "$class_hash
    done
}

make() {
    echo "building project"
    #build

    echo "Declaring all contracts"

    declare_all
}

make