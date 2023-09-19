use starknet::ContractAddress;

#[starknet::interface]
trait IERC3525<T> {
    fn valueDecimals(self: @T) -> felt252;

    fn valueOf(self: @T, tokenId: u256) -> u256;

    fn slotOf(self: @T, tokenId: u256) -> u256;

    fn approveValue(ref self: T, tokenId: u256, operator: felt252, value: u256);

    fn allowance(self: @T, tokenId: u256, operator: felt252) -> u256;

    fn transferValueFrom(
        ref self: T, fromTokenId: u256, toTokenId: u256, to: felt252, value: u256
    ) -> u256;

    //
    // 721 Enumerable
    //

    fn name(self: @T) -> felt252;

    fn symbol(self: @T) -> felt252;

    fn balanceOf(self: @T, owner: felt252) -> u256;

    fn ownerOf(self: @T, tokenId: u256) -> ContractAddress;

    fn safeTransferFrom(
        ref self: T, from_: felt252, to: felt252, tokenId: u256, data: Array<felt252>
    );

    fn transferFrom(ref self: T, from_: felt252, to: felt252, tokenId: u256);

    fn approve(ref self: T, approved: felt252, tokenId: u256);

    fn setApprovalForAll(ref self: T, operator: felt252, approved: felt252);

    fn getApproved(self: @T, tokenId: u256) -> felt252;

    fn isApprovedForAll(self: @T, owner: felt252, operator: felt252) -> felt252;

    fn totalSupply(self: @T) -> u256;

    fn tokenByIndex(self: @T, index: u256) -> u256;

    fn tokenOfOwnerByIndex(self: @T, owner: felt252, index: u256) -> u256;

    fn tokenURI(self: @T, tokenId: u256) -> Span<felt252>;

    //
    // 3525 Metadata
    //

    fn contractURI(self: @T) -> Span<felt252>;

    fn slotURI(self: @T, slot: u256) -> Span<felt252>;

    //
    // Slot Approvable
    //

    fn setApprovalForSlot(
        ref self: T, owner: felt252, slot: u256, operator: felt252, approved: felt252
    );

    fn isApprovedForSlot(self: @T, owner: felt252, slot: u256, operator: felt252) -> felt252;

    //
    // Slot Enumerable
    //

    fn slotCount(self: @T,) -> u256;

    fn slotByIndex(self: @T, index: u256) -> u256;

    fn tokenSupplyInSlot(self: @T, slot: u256) -> u256;

    fn tokenInSlotByIndex(self: @T, slot: u256, index: u256) -> u256;

    //
    // Mintable Burnable
    //

    fn mint(ref self: T, to: felt252, token_id: u256, slot: u256, value: u256);

    fn mintNew(ref self: T, to: felt252, slot: u256, value: u256) -> u256;

    fn mintValue(ref self: T, tokenId: u256, value: u256);

    fn burn(ref self: T, tokenId: u256);

    fn burnValue(ref self: T, tokenId: u256, value: u256);

    //
    // Additional methods
    //

    fn split(
        ref self: T, tokenId: u256, amounts_len: felt252, amounts: Array<felt252>
    ) -> Array<felt252>;

    fn merge(ref self: T, tokenIds: Array<u256>);

    fn totalValue(ref self: T, slot: u256) -> u256;
}
