use starknet::ContractAddress;

#[starknet::interface]
trait IERC3525<TContractState> {
    fn valueDecimals(self: @TContractState) -> felt252;

    fn valueOf(self: @TContractState, tokenId: u256) -> u256;

    fn slotOf(self: @TContractState, tokenId: u256) -> u256;

    fn approveValue(ref self: TContractState, tokenId: u256, operator: felt252, value: u256);

    fn allowance(self: @TContractState, tokenId: u256, operator: felt252) -> u256;

    fn transferValueFrom(
        ref self: TContractState, fromTokenId: u256, toTokenId: u256, to: felt252, value: u256
    ) -> u256;

    //
    // 721 Enumerable
    //

    fn name(self: @TContractState) -> felt252;

    fn symbol(self: @TContractState) -> felt252;

    fn balanceOf(self: @TContractState, owner: felt252) -> u256;

    fn ownerOf(self: @TContractState, tokenId: u256) -> ContractAddress;

    fn safeTransferFrom(
        ref self: TContractState, from_: felt252, to: felt252, tokenId: u256, data: Array<felt252>
    );

    fn transferFrom(ref self: TContractState, from_: felt252, to: felt252, tokenId: u256);

    fn approve(ref self: TContractState, approved: felt252, tokenId: u256);

    fn setApprovalForAll(ref self: TContractState, operator: felt252, approved: felt252);

    fn getApproved(self: @TContractState, tokenId: u256) -> felt252;

    fn isApprovedForAll(self: @TContractState, owner: felt252, operator: felt252) -> felt252;

    fn totalSupply(self: @TContractState) -> u256;

    fn tokenByIndex(self: @TContractState, index: u256) -> u256;

    fn tokenOfOwnerByIndex(self: @TContractState, owner: felt252, index: u256) -> u256;

    fn tokenURI(self: @TContractState, tokenId: u256) -> Array<felt252>;

    //
    // 3525 Metadata
    //

    fn contractURI(self: @TContractState) -> Array<felt252>;

    fn slotURI(self: @TContractState, slot: u256) -> Array<felt252>;

    //
    // Slot Approvable
    //

    fn setApprovalForSlot(
        ref self: TContractState, owner: felt252, slot: u256, operator: felt252, approved: felt252
    );

    fn isApprovedForSlot(
        self: @TContractState, owner: felt252, slot: u256, operator: felt252
    ) -> felt252;

    //
    // Slot Enumerable
    //

    fn slotCount(self: @TContractState, ) -> u256;

    fn slotByIndex(self: @TContractState, index: u256) -> u256;

    fn tokenSupplyInSlot(self: @TContractState, slot: u256) -> u256;

    fn tokenInSlotByIndex(self: @TContractState, slot: u256, index: u256) -> u256;

    //
    // Mintable Burnable
    //

    fn mint(ref self: TContractState, to: felt252, token_id: u256, slot: u256, value: u256);

    fn mintNew(ref self: TContractState, to: felt252, slot: u256, value: u256) -> u256;

    fn mintValue(ref self: TContractState, tokenId: u256, value: u256);

    fn burn(ref self: TContractState, tokenId: u256);

    fn burnValue(ref self: TContractState, tokenId: u256, value: u256);

    //
    // Additional methods
    //

    fn split(
        ref self: TContractState, tokenId: u256, amounts_len: felt252, amounts: Array<felt252>
    ) -> Array<felt252>;

    fn merge(ref self: TContractState, tokenIds: Array<u256>);

    fn totalValue(ref self: TContractState, slot: u256) -> u256;
}
