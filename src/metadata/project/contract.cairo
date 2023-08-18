#[starknet::contract]
mod ContractMetadata {
    use metadata::metadata::project::generator::generate_contract_uri;
    use metadata::interfaces::contract_metadata::IContractMetadata;

    #[storage]
    struct Storage {}


    #[external(v0)]
    impl ContractMetadata of IContractMetadata<ContractState> {
        fn construct_contract_uri(self: @ContractState) -> Span<felt252> {
            generate_contract_uri()
        }
    }
}
