#[starknet::interface]
trait IComponent<T> {
    fn name(self: @T) -> felt252;
    fn render(self: @T, args: Option<Span<felt252>>) -> Array<felt252>;
}
