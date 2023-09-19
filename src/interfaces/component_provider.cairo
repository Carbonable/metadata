use starknet::class_hash::ClassHash;
use metadata::interfaces::component::IComponentLibraryDispatcher;

#[starknet::interface]
trait IComponentProvider<T> {
    fn register(ref self: T, id: felt252, implementation: ClassHash);
    fn get(self: @T, id: felt252) -> IComponentLibraryDispatcher;
}
