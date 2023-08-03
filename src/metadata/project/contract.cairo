#[starknet::contract]
mod ContractMetadata {
    use metadata::metadata::project::generator::generate_contract_uri;
    use metadata::metadata::project::data::fetch_contract_data;

    #[storage]
    struct Storage {}

    #[generate_trait]
    #[external(v0)]
    impl ContractMetadata of IContractMetadata {
        fn construct_contract_uri(self: @ContractState) -> Span<felt252> {
            let contract_data = fetch_contract_data();
            generate_contract_uri(contract_data)
        }
    }
}
