#[starknet::contract]
mod ProjectMock {
    use starknet::ContractAddress;
    use starknet::get_caller_address;
    use core::Into;
    use array::ArrayTrait;
    use metadata::interfaces::project::IProject;
    use metadata::interfaces::erc3525::IERC3525;
    use metadata::interfaces::erc165::IERC165;
    use metadata::metadata::common::data::{
        IERC165_ID, IERC3525_ID, IERC3525_METADATA_ID, IERC721_ID, IERC721_METADATA_ID
    };

    #[storage]
    struct Storage {
        provider: ContractAddress,
    }

    #[external(v0)]
    impl ProjectMockImpl of IProject<ContractState> {
        fn getProjectValue(self: @ContractState, slot: u256) -> u256 {
            31337_000000_u256
        }

        fn get_component_provider(self: @ContractState) -> ContractAddress {
            self.provider.read()
        }

        fn set_component_provider(ref self: ContractState, provider: ContractAddress) {
            self.provider.write(provider)
        }
    }

    #[external(v0)]
    impl ERC165Impl of IERC165<ContractState> {
        fn supportsInterface(self: @ContractState, interface_id: u32) -> bool {
            interface_id == IERC165_ID
                || interface_id == IERC721_ID
                || interface_id == IERC721_METADATA_ID
                || interface_id == IERC3525_ID
                || interface_id == IERC3525_METADATA_ID
        }
    }

    #[external(v0)]
    impl ERC3525Impl of IERC3525<ContractState> {
        fn valueDecimals(self: @ContractState) -> felt252 {
            6
        }

        fn valueOf(self: @ContractState, tokenId: u256) -> u256 {
            42_u256
        }

        fn slotOf(self: @ContractState, tokenId: u256) -> u256 {
            1_u256
        }

        fn approveValue(ref self: ContractState, tokenId: u256, operator: felt252, value: u256) {}

        fn allowance(self: @ContractState, tokenId: u256, operator: felt252) -> u256 {
            10000000000000000000_u256
        }

        fn transferValueFrom(
            ref self: ContractState, fromTokenId: u256, toTokenId: u256, to: felt252, value: u256
        ) -> u256 {
            1_u256
        }

        //
        // 721 Enumerable
        //

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
            // TODO
            Default::default().span()
        }

        //
        // 3525 Metadata
        //

        fn contractURI(self: @ContractState,) -> Span<felt252> {
            // TODO
            Default::default().span()
        }

        fn slotURI(self: @ContractState, slot: u256) -> Span<felt252> {
            // TODO
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
            self.getProjectValue(slot)
        }
    }
}
