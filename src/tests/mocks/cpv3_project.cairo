use metadata::metadata::vintages::models::{CarbonVintageType, CarbonVintage};

#[starknet::interface]
trait ICPV3ProjectMock<TContractState> {
    /// Returns the project total carbon credits.
    fn get_project_carbon(self: @TContractState) -> u128;

    /// Returns the number of vintages of the project.
    fn get_num_vintages(self: @TContractState) -> usize;

    /// Returns all available vintage details.
    fn get_cc_vintages(self: @TContractState) -> Span<CarbonVintage>;

    /// Returns the vintage details with the given token_id.
    fn get_carbon_vintage(self: @TContractState, token_id: u256) -> CarbonVintage;

    /// Get number of decimal for total supply to have a carbon credit
    fn get_cc_decimals(self: @TContractState) -> u8;

    fn get_vintage_range(self: @TContractState) -> (u32, u32);
}


#[starknet::contract]
mod CPV3ProjectMock {
    use starknet::ContractAddress;
    use starknet::{get_caller_address, get_block_timestamp};
    use metadata::interfaces::absorber::IAbsorber;
    use metadata::interfaces::component_provider::IProviderExt;
    use metadata::metadata::vintages::models::{CarbonVintageType, CarbonVintage};

    use cairo_erc_3525::interface::IERC3525;
    use cairo_erc_3525::extensions::slotenumerable::interface::{
        IERC3525SlotEnumerable, IERC3525_SLOT_ENUMERABLE_ID
    };
    use cairo_erc_3525::extensions::metadata::interface::IERC3525_METADATA_ID;
    use cairo_erc_3525::interface::IERC3525_ID;

    use openzeppelin::token::erc721::interface::{IERC721_ID, IERC721_METADATA_ID};
    use openzeppelin::introspection::interface::{ISRC5, ISRC5Camel, ISRC5_ID};
    use openzeppelin::introspection::src5::SRC5;

    #[storage]
    struct Storage {
        provider: ContractAddress,
    }
    #[constructor]
    fn constructor(ref self: ContractState,) {
        let mut unsafe_state = SRC5::unsafe_new_contract_state();
        SRC5::InternalImpl::register_interface(ref unsafe_state, ISRC5_ID);
    }

    #[external(v0)]
    impl MockProviderImpl of IProviderExt<ContractState> {
        fn get_component_provider(self: @ContractState) -> ContractAddress {
            self.provider.read()
        }

        fn set_component_provider(ref self: ContractState, provider: ContractAddress) {
            self.provider.write(provider)
        }
    }

    #[external(v0)]
    impl MockVintagesImpl of super::ICPV3ProjectMock<ContractState> {
        fn get_vintage_range(self: @ContractState) -> (u32, u32) {
            (2023, 2025)
        }

        fn get_project_carbon(self: @ContractState) -> u128 {
            3133700000000
        }

        /// Returns the number of vintages of the project.
        fn get_num_vintages(self: @ContractState) -> usize {
            3
        }

        /// Returns all available vintage details.
        fn get_cc_vintages(self: @ContractState) -> Span<CarbonVintage> {
            array![
                CarbonVintage {
                    year: 2023, supply: 133700000000, failed: 0, status: CarbonVintageType::Audited,
                },
                CarbonVintage {
                    year: 2024,
                    supply: 1000000000000,
                    failed: 0,
                    status: CarbonVintageType::Projected,
                },
                CarbonVintage {
                    year: 2025,
                    supply: 2000000000000,
                    failed: 0,
                    status: CarbonVintageType::Projected,
                }
            ]
                .span()
        }

        /// Returns the vintage details with the given token_id.
        fn get_carbon_vintage(self: @ContractState, token_id: u256) -> CarbonVintage {
            let v = self.get_cc_vintages();
            *v[token_id.try_into().unwrap()]
        }

        /// Get number of decimal for total supply to have a carbon credit
        fn get_cc_decimals(self: @ContractState) -> u8 {
            8
        }
    }

    #[external(v0)]
    impl SRC5Impl of ISRC5<ContractState> {
        fn supports_interface(self: @ContractState, interface_id: felt252) -> bool {
            let unsafe_state = SRC5::unsafe_new_contract_state();
            SRC5::SRC5Impl::supports_interface(@unsafe_state, interface_id)
        }
    }

    #[external(v0)]
    impl SRC5CamelImpl of ISRC5Camel<ContractState> {
        fn supportsInterface(self: @ContractState, interfaceId: felt252) -> bool {
            self.supports_interface(interfaceId)
        }
    }
}
