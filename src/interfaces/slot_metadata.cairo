use starknet::ContractAddress;

#[starknet::interface]
trait ISlotMetadata<TContractState> {
    fn construct_slot_uri(self: @TContractState, slot: u256) -> Array<felt252>;
    fn construct_token_uri(self: @TContractState, token: u256) -> Array<felt252>;
}
