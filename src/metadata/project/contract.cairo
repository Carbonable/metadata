#[starknet::contract]
mod ContractMetadata {
    use metadata::metadata::project::generator::generate_contract_uri;

    #[storage]
    struct Storage {}

    #[generate_trait]
    #[external(v0)]
    impl ContractMetadata of IContractMetadata {
        fn construct_contract_uri(self: @ContractState) -> Span<felt252> {
            generate_contract_uri()
        }
    }
}
