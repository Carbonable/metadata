#[starknet::interface]
trait IComponent<TContractState> {
    fn name(self: @TContractState) -> felt252;
    // Get with params?
    // fn get(self: @TContractState, params: Span<felt252>) -> u256;
    fn get(self: @TContractState) -> Span<felt252>;
    fn concat(self: @TContractState, data: Array<felt252>) -> Array<felt252>;
}
