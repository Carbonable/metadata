#[starknet::contract]
mod ComponentProvider {
    use starknet::class_hash::ClassHash;
    use metadata::interfaces::component::{IComponentDispatcherTrait, IComponentLibraryDispatcher};
    use metadata::interfaces::component_provider::IComponentProvider;
    #[storage]
    struct Storage {
        components: LegacyMap<felt252, ClassHash>,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {}

    #[external(v0)]
    impl ComponentProvider of IComponentProvider<ContractState> {
        fn register(ref self: ContractState, id: felt252, implementation: ClassHash) {
            let component_class: ClassHash = self.components.read(id);
            assert(component_class.is_zero(), 'Component already registered');

            // Idea: get id from component not as parameter
            // Check that implementation has the correct interface

            self.components.write(id, implementation);
        }

        fn get(self: @ContractState, id: felt252) -> IComponentLibraryDispatcher {
            let component_class: ClassHash = self.components.read(id);
            assert(!component_class.is_zero(), 'Component not registered');
            IComponentLibraryDispatcher { class_hash: component_class }
        }
    }
}
