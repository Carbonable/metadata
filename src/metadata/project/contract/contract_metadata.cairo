#[starknet::contract]
mod ContractMetadata {
    #[generate_trait]
    #[external(v0)]
    impl ContractMetadata of IContractMetadata {
        fn construct_contract_uri(self: @ContractState) -> @Array<felt252> {
            let uri = Default::default();
            generate_contract_uri();
            return @uri;
        }
    }
}
