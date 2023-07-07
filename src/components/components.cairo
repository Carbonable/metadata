#[starknet::contract]
mod ComponentLibrary {
    #[storage]
    struct Storage {
        components: LegacyMap<felt252, felt252>, 
    }

    #[constructor]
    fn constructor(ref self: ContractState) {}

    #[generate_trait]
    #[external(v0)]
    impl ComponentLibrary of IComponentLibrary {
        // TODO: handle component dependencies?
        fn register(self: @ContractState, id: felt252, implementation: felt252) {
            self.components.read(id);
        }

        fn get(self: @ContractState, id: felt252) -> felt252 {
            self.components.read(id)
        }
    }
}
