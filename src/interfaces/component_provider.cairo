use starknet::ContractAddress;
use starknet::class_hash::ClassHash;
use metadata::interfaces::component::IComponentLibraryDispatcher;

#[starknet::interface]
trait IComponentProvider<T> {
    fn register(ref self: T, implementation: ClassHash);
    fn get(self: @T, id: felt252) -> Option<IComponentLibraryDispatcher>;
}

#[starknet::interface]
trait IProviderExt<T> {
    fn get_component_provider(self: @T) -> ContractAddress;
    fn set_component_provider(ref self: T, provider: ContractAddress);
}
