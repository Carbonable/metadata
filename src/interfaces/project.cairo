use starknet::ContractAddress;

#[starknet::interface]
trait IProject<TContractState> {
    fn getProjectValue(self: @TContractState, slot: u256) -> u256;
    fn get_component_provider(self: @TContractState) -> ContractAddress;
    fn set_component_provider(ref self: TContractState, provider: ContractAddress);
}
