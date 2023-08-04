use starknet::class_hash::ClassHash;

#[starknet::interface]
trait IComponentProvider<TContractState> {
    fn register(self: @TContractState, id: felt252, implementation: ClassHash);
    fn get(self: @TContractState, id: felt252) -> Span<felt252>;
}

