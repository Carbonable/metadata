use starknet::ContractAddress;

const IERC3525_ID: felt252 = 0xd5358140;
const IERC3525_RECEIVER_ID: felt252 = 0x009ce20b;

#[starknet::interface]
trait IERC3525<TContractState> {
    fn value_decimals(self: @TContractState) -> u8;
    fn value_of(self: @TContractState, token_id: u256) -> u256;
    fn slot_of(self: @TContractState, token_id: u256) -> u256;
    fn approve_value(
        ref self: TContractState, token_id: u256, operator: ContractAddress, value: u256
    );
    fn allowance(self: @TContractState, token_id: u256, operator: ContractAddress) -> u256;
    fn transfer_value_from(
        ref self: TContractState,
        from_token_id: u256,
        to_token_id: u256,
        to: ContractAddress,
        value: u256
    ) -> u256;
}

#[starknet::interface]
trait IERC3525SlotEnumerable<TContractState> {
    fn slot_count(self: @TContractState) -> u256;
    fn slot_by_index(self: @TContractState, index: u256) -> u256;
    fn token_supply_in_slot(self: @TContractState, slot: u256) -> u256;
    fn token_in_slot_by_index(self: @TContractState, slot: u256, index: u256) -> u256;
}
