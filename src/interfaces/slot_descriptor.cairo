#[starknet::interface]
trait ISlotDescriptor<T> {
    fn construct_slot_uri(self: @T, slot: u256) -> Span<felt252>;
    fn construct_token_uri(self: @T, token_id: u256) -> Span<felt252>;
}
