use starknet::ContractAddress;

#[starknet::interface]
trait IProject<T> {
    fn getProjectValue(self: @T, slot: u256) -> u256;
    fn get_component_provider(self: @T) -> ContractAddress;
    fn set_component_provider(ref self: T, provider: ContractAddress);
}
