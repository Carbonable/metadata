#[starknet::interface]
trait IComponentLibrary<TContractState> {
    fn register(self: @ContractState, id: felt252, implementation: felt252);

    fn get(self: @ContractState, id: felt252) -> Array<felt252>;
}

