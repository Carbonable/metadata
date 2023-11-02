#[starknet::contract]
mod JaguarIpfsUri {
    use metadata::interfaces::slot_descriptor::ISlotDescriptor;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl JaguarIpfsUriImpl of ISlotDescriptor<ContractState> {
        fn construct_slot_uri(self: @ContractState, slot: u256) -> Span<felt252> {
            let uri: Array<felt252> = array![
                'ipfs://QmPqqdWR6ZAJPisPy5YzTXcR', 'kjQAGyXL183w6PasEhD9Dv/', 'token.json'
            ];

            uri.span()
        }

        fn construct_token_uri(self: @ContractState, token_id: u256) -> Span<felt252> {
            // [Check] calling contract is erc3525 compatible
            self.construct_slot_uri(token_id)
        }
    }
}

