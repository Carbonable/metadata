#[starknet::contract]
mod BanegasFarmUri {
    use metadata::metadata::slots::template::slot::generate_slot_uri;
    use metadata::metadata::slots::template::token::generate_token_uri;
    use metadata::metadata::slots::banegasfarm::data::fetch_slot_data;

    #[storage]
    struct Storage {}

    #[generate_trait]
    #[external(v0)]
    impl BanegasFarmMetadata of IBanegasFarmUri {
        fn construct_slot_uri(self: @ContractState, slot: u256) -> Array<felt252> {
            let slot_data = fetch_slot_data(slot);
            generate_slot_uri(slot, slot_data)
        }

        fn construct_token_uri(self: @ContractState, token_id: u256) -> Array<felt252> {
            generate_token_uri(token_id, 'tokendata')
        }
    }
}
