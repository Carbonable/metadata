#[starknet::interface]
trait IComponent<TContractState> {
    fn name(self: @TContractState) -> felt252;
    fn render(self: @TContractState, args: Option<Span<felt252>>) -> Array<felt252>;
}
