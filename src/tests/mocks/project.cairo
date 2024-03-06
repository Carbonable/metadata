#[starknet::contract]
mod ProjectMock {
    use starknet::ContractAddress;
    use starknet::{get_caller_address, get_block_timestamp};
    use metadata::interfaces::absorber::IAbsorber;
    use metadata::interfaces::component_provider::IProviderExt;

    use cairo_erc_3525::interface::IERC3525;
    use cairo_erc_3525::extensions::slotenumerable::interface::{
        IERC3525SlotEnumerable, IERC3525_SLOT_ENUMERABLE_ID
    };
    use cairo_erc_3525::extensions::metadata::interface::IERC3525_METADATA_ID;
    use cairo_erc_3525::interface::IERC3525_ID;

    use openzeppelin::token::erc721::interface::{IERC721_ID, IERC721_METADATA_ID};
    use openzeppelin::introspection::interface::{ISRC5, ISRC5Camel};
    use openzeppelin::introspection::src5::SRC5;

    #[storage]
    struct Storage {
        provider: ContractAddress,
    }
    #[constructor]
    fn constructor(ref self: ContractState,) {
        let mut unsafe_state = SRC5::unsafe_new_contract_state();
        SRC5::InternalImpl::register_interface(ref unsafe_state, IERC721_ID);
        SRC5::InternalImpl::register_interface(ref unsafe_state, IERC721_METADATA_ID);
        SRC5::InternalImpl::register_interface(ref unsafe_state, IERC3525_ID);
        SRC5::InternalImpl::register_interface(ref unsafe_state, IERC3525_METADATA_ID);
        SRC5::InternalImpl::register_interface(ref unsafe_state, IERC3525_SLOT_ENUMERABLE_ID);
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
    impl MockAbsorberImpl of IAbsorber<ContractState> {
        fn get_start_time(self: @ContractState, slot: u256) -> u64 {
            1693284726
        }
        fn get_final_time(self: @ContractState, slot: u256) -> u64 {
            1793289203
        }
        fn get_times(self: @ContractState, slot: u256) -> Span<u64> {
            Default::default().span()
        }
        fn get_absorptions(self: @ContractState, slot: u256) -> Span<u64> {
            Default::default().span()
        }

        fn get_absorption(self: @ContractState, slot: u256, time: u64) -> u64 {
            time * 1_000
        }
        fn get_current_absorption(self: @ContractState, slot: u256) -> u64 {
            // 157_300001
            41040_000001
        }
        fn get_final_absorption(self: @ContractState, slot: u256) -> u64 {
            410400_000000 // Karathuru
        // 1573_000000 // BanegasFarm
        }
        fn get_project_value(self: @ContractState, slot: u256) -> u256 {
            2_139_004_800000
        }
        fn get_ton_equivalent(self: @ContractState, slot: u256) -> u64 {
            1_000_000
        }
        fn is_setup(self: @ContractState, slot: u256) -> bool {
            true
        }
        fn set_absorptions(
            ref self: ContractState,
            slot: u256,
            times: Span<u64>,
            absorptions: Span<u64>,
            ton_equivalent: u64
        ) {}
        fn set_project_value(ref self: ContractState, slot: u256, project_value: u256) {}
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

    // #[external(v0)]
    // impl ERC165Impl of IERC165<ContractState> {
    //     fn supportsInterface(self: @ContractState, interface_id: u32) -> bool {
    //         interface_id == IERC165_ID
    //             || interface_id == IERC721_ID
    //             || interface_id == IERC721_METADATA_ID
    //             || interface_id == IERC3525_ID
    //             || interface_id == IERC3525_METADATA_ID
    //     }
    // }

    #[external(v0)]
    impl ERC3525Impl of IERC3525<ContractState> {
        fn value_decimals(self: @ContractState) -> u8 {
            6
        }

        fn value_of(self: @ContractState, token_id: u256) -> u256 {
            200 * 1_000000
        }

        fn slot_of(self: @ContractState, token_id: u256) -> u256 {
            1_u256
        }

        fn approve_value(
            ref self: ContractState, token_id: u256, operator: ContractAddress, value: u256
        ) {}

        fn allowance(self: @ContractState, token_id: u256, operator: ContractAddress) -> u256 {
            10000000000000000000_u256
        }

        fn transfer_value_from(
            ref self: ContractState,
            from_token_id: u256,
            to_token_id: u256,
            to: ContractAddress,
            value: u256
        ) -> u256 {
            1_u256
        }
    }


    //
    // Slot Enumerable
    //
    #[external(v0)]
    impl MockSlotEnumImpl of IERC3525SlotEnumerable<ContractState> {
        fn slot_count(self: @ContractState) -> u256 {
            1_u256
        }

        fn slot_by_index(self: @ContractState, index: u256) -> u256 {
            index
        }

        fn token_supply_in_slot(self: @ContractState, slot: u256) -> u256 {
            10_u256
        }

        fn token_in_slot_by_index(self: @ContractState, slot: u256, index: u256) -> u256 {
            index + slot
        }
    }


    //
    // Others
    //

    #[generate_trait]
    #[external(v0)]
    impl MockImpl of OtherTrait {
        fn name(self: @ContractState) -> felt252 {
            'mock project'
        }

        fn symbol(self: @ContractState) -> felt252 {
            'MP'
        }

        fn balanceOf(self: @ContractState, owner: felt252) -> u256 {
            1_u256
        }

        fn ownerOf(self: @ContractState, tokenId: u256) -> ContractAddress {
            get_caller_address()
        }

        fn safeTransferFrom(
            ref self: ContractState,
            from_: felt252,
            to: felt252,
            tokenId: u256,
            data: Array<felt252>
        ) {}

        fn transferFrom(ref self: ContractState, from_: felt252, to: felt252, tokenId: u256) {}

        fn approve(ref self: ContractState, approved: felt252, tokenId: u256) {}

        fn setApprovalForAll(ref self: ContractState, operator: felt252, approved: felt252) {}

        fn getApproved(self: @ContractState, tokenId: u256) -> felt252 {
            1
        }

        fn isApprovedForAll(self: @ContractState, owner: felt252, operator: felt252) -> felt252 {
            1
        }

        fn totalSupply(self: @ContractState) -> u256 {
            10_u256
        }

        fn tokenByIndex(self: @ContractState, index: u256) -> u256 {
            index
        }

        fn tokenOfOwnerByIndex(self: @ContractState, owner: felt252, index: u256) -> u256 {
            index + owner.into()
        }

        fn tokenURI(self: @ContractState, tokenId: u256) -> Span<felt252> {
            Default::default().span()
        }

        //
        // 3525 Metadata
        //

        fn contractURI(self: @ContractState,) -> Span<felt252> {
            Default::default().span()
        }

        fn slotURI(self: @ContractState, slot: u256) -> Span<felt252> {
            Default::default().span()
        }

        //
        // Slot Approvable
        //

        fn setApprovalForSlot(
            ref self: ContractState,
            owner: felt252,
            slot: u256,
            operator: felt252,
            approved: felt252
        ) {}

        fn isApprovedForSlot(
            self: @ContractState, owner: felt252, slot: u256, operator: felt252
        ) -> felt252 {
            1
        }

        //
        // Slot Enumerable
        //

        fn slotCount(self: @ContractState,) -> u256 {
            1_u256
        }

        fn slotByIndex(self: @ContractState, index: u256) -> u256 {
            index
        }

        fn tokenSupplyInSlot(self: @ContractState, slot: u256) -> u256 {
            10_u256
        }

        fn tokenInSlotByIndex(self: @ContractState, slot: u256, index: u256) -> u256 {
            index + slot
        }

        //
        // Mintable Burnable
        //

        fn mint(ref self: ContractState, to: felt252, token_id: u256, slot: u256, value: u256) {}

        fn mintNew(ref self: ContractState, to: felt252, slot: u256, value: u256) -> u256 {
            1_u256
        }

        fn mintValue(ref self: ContractState, tokenId: u256, value: u256) {}

        fn burn(ref self: ContractState, tokenId: u256) {}

        fn burnValue(ref self: ContractState, tokenId: u256, value: u256) {}

        //
        // Additional methods
        //

        fn split(
            ref self: ContractState, tokenId: u256, amounts_len: felt252, amounts: Array<felt252>
        ) -> Array<felt252> {
            Default::default()
        }

        fn merge(ref self: ContractState, tokenIds: Array<u256>) {}

        fn totalValue(ref self: ContractState, slot: u256) -> u256 {
            4096
        }
    }
}
