#[starknet::contract]
mod ComponentProvider {
    use starknet::class_hash::ClassHash;
    use metadata::interfaces::component::{IComponentDispatcherTrait, IComponentLibraryDispatcher};

    #[storage]
    struct Storage {
        components: LegacyMap<felt252, IComponentLibraryDispatcher>, 
    }

    #[constructor]
    fn constructor(ref self: ContractState) {}

    #[generate_trait]
    #[external(v0)]
    impl ComponentProvider of IComponentProvider {
        // TODO: handle component dependencies?
        // Add possibility to add arguments
        fn register(ref self: ContractState, id: felt252, implementation: ClassHash) {
            // TODO checks
            self.components.write(id, IComponentLibraryDispatcher { class_hash: implementation });
        }

        fn get(self: @ContractState, id: felt252) -> Span<felt252> {
            let component: IComponentLibraryDispatcher = self.components.read(id);
            component.get()
        }
    }
}
