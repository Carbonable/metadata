use starknet::ContractAddress;

#[starknet::interface]
trait IProject<TContractState> {
    fn getProjectValue(self: @TContractState, slot: u256) -> u256;
}
