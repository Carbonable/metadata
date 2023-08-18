#[starknet::contract]
mod BanegasFarmUri {
    use starknet::get_contract_address;

    use metadata::metadata::slots::template::slot::generate_slot_uri;
    use metadata::metadata::slots::template::token::generate_token_uri;
    use metadata::metadata::slots::banegasfarm::data::fetch_slot_data;
    use metadata::metadata::slots::banegasfarm::data::fetch_token_data;

    use metadata::interfaces::slot_metadata::ISlotMetadata;

    #[storage]
    struct Storage {}

    #[generate_trait]
    #[external(v0)]
    impl BanegasFarmMetadata of IBanegasFarmUri {
        fn construct_slot_uri(self: @ContractState, slot: u256) -> Span<felt252> {
            let contract = get_contract_address();
            super::Assert::compatible(contract);

            let slot_data = fetch_slot_data(contract, slot);
            generate_slot_uri(slot, slot_data)
        }

        fn construct_token_uri(self: @ContractState, token_id: u256) -> Span<felt252> {
            // [Check] calling contract is erc3525 compatible
            let contract = get_contract_address();
            super::Assert::compatible(contract);

            let token_data = fetch_token_data(contract, token_id);
            generate_token_uri(token_id, token_data)
        }
    }
}

mod Assert {
    use starknet::ContractAddress;
    use metadata::interfaces::erc165::{IERC165Dispatcher, IERC165DispatcherTrait};
    use metadata::metadata::common::data;

    #[inline(always)]
    fn erc165(contract: ContractAddress) {
        let instance = IERC165Dispatcher { contract_address: contract };
        let is_165 = instance.supportsInterface(data::IERC165_ID);
        assert(is_165, 'Metadata: not IERC165');
    }

    #[inline(always)]
    fn compatible(contract: ContractAddress) {
        let instance = IERC165Dispatcher { contract_address: contract };
        erc165(contract);
        let is_3525 = instance.supportsInterface(data::IERC3525_ID);
        let is_3525_meta = instance.supportsInterface(data::IERC3525_METADATA_ID);
        let is_721 = instance.supportsInterface(data::IERC721_ID);
        let is_721_meta = instance.supportsInterface(data::IERC721_METADATA_ID);
        let compatible = is_3525 & is_3525_meta & is_721 & is_721_meta;
        assert(compatible, 'Metadata: not IERC3525');
    }
}
