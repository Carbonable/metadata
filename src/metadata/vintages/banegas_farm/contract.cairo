#[starknet::interface]
trait IMetadataDescriptor<TContractState> {
    fn construct_uri(self: @TContractState, token_id: u256) -> Span<felt252>;
}

#[starknet::contract]
mod BanegasCPV3Uri {
    use starknet::{get_contract_address, ContractAddress};

    use metadata::metadata::vintages::template::{svg, storage, data as template_data};
    use metadata::metadata::vintages::template::json::generate_json;
    use metadata::metadata::vintages::banegas_farm::static::get_static_data;

    use debug::PrintTrait;

    use openzeppelin::introspection::interface::{ISRC5Dispatcher, ISRC5DispatcherTrait, ISRC5_ID};

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl CPV3Metadata of super::IMetadataDescriptor<ContractState> {
        fn construct_uri(self: @ContractState, token_id: u256) -> Span<felt252> {
            // [Check] calling contract is compatible
            let contract = get_contract_address();
            self.compatible(contract);
            let static_data = get_static_data();
            generate_json(contract, token_id, static_data)
        }
    }
    #[generate_trait]
    impl CPV3MetadataInternal of IInternal {
        fn compatible(self: @ContractState, contract_address: ContractAddress) {
            let src5 = ISRC5Dispatcher { contract_address };
            let is_SRC5 = src5.supports_interface(ISRC5_ID);
            assert(src5.supports_interface(ISRC5_ID), 'ISRC5 not supported');
        // TODO
        // assert(src5.supports_interface(IERC1155_ID), 'IERC1155 not supported');
        }
    }
}

