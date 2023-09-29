#[starknet::contract]
mod LasDeliciasUri {
    use starknet::get_contract_address;

    use metadata::metadata::common::assert_helper;
    use metadata::interfaces::slot_descriptor::ISlotDescriptor;
    use metadata::metadata::slots::template::slot::generate_slot_uri;
    use metadata::metadata::slots::template::token::generate::generate_token_uri;
    use metadata::metadata::slots::las_delicias::data::get_static_data;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl LasDeliciasMetadata of ISlotDescriptor<ContractState> {
        fn construct_slot_uri(self: @ContractState, slot: u256) -> Span<felt252> {
            let contract = get_contract_address();
            assert_helper::compatible(contract);

            let static_data = get_static_data();
            generate_slot_uri(contract, slot, static_data)
        }

        fn construct_token_uri(self: @ContractState, token_id: u256) -> Span<felt252> {
            // [Check] calling contract is erc3525 compatible
            let contract = get_contract_address();
            assert_helper::compatible(contract);

            let static_data = get_static_data();
            generate_token_uri(contract, token_id, static_data)
        }
    }
}
