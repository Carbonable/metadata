#[starknet::contract]
mod ComponentProvider {
    use starknet::{ClassHash, ContractAddress};

    use metadata::interfaces::component::{IComponentDispatcherTrait, IComponentLibraryDispatcher};
    use metadata::interfaces::component_provider::IComponentProvider;

    use openzeppelin::access::ownable::interface::IOwnable;
    use openzeppelin::access::ownable::ownable::Ownable;

    #[storage]
    struct Storage {
        components: LegacyMap<felt252, ClassHash>,
    }

    #[constructor]
    fn constructor(ref self: ContractState, owner: ContractAddress) {
        self.initializer(owner);
    }

    #[external(v0)]
    impl OwnableImpl of IOwnable<ContractState> {
        fn owner(self: @ContractState) -> ContractAddress {
            let unsafe_state = Ownable::unsafe_new_contract_state();
            Ownable::OwnableImpl::owner(@unsafe_state)
        }

        fn transfer_ownership(ref self: ContractState, new_owner: ContractAddress) {
            let mut unsafe_state = Ownable::unsafe_new_contract_state();
            Ownable::OwnableImpl::transfer_ownership(ref unsafe_state, new_owner)
        }

        fn renounce_ownership(ref self: ContractState) {
            let mut unsafe_state = Ownable::unsafe_new_contract_state();
            Ownable::OwnableImpl::renounce_ownership(ref unsafe_state)
        }
    }

    #[external(v0)]
    impl ComponentProvider of IComponentProvider<ContractState> {
        fn register(ref self: ContractState, implementation: ClassHash) {
            let unsafe_state = Ownable::unsafe_new_contract_state();
            Ownable::InternalImpl::assert_only_owner(@unsafe_state);

            let component = IComponentLibraryDispatcher { class_hash: implementation };
            let name = component.name();
            let component_class: ClassHash = self.components.read(name);
            assert(component_class.is_zero(), 'Component already registered');

            self.components.write(name, implementation);
        }

        fn get(self: @ContractState, id: felt252) -> Option<IComponentLibraryDispatcher> {
            let component_class: ClassHash = self.components.read(id);
            if component_class.is_zero() {
                return Option::None;
            } else {
                return Option::Some(IComponentLibraryDispatcher { class_hash: component_class });
            }
        }
    }

    #[generate_trait]
    impl InternalImpl of InternalTrait {
        fn initializer(ref self: ContractState, owner: ContractAddress) {
            let mut unsafe_state = Ownable::unsafe_new_contract_state();
            Ownable::InternalImpl::initializer(ref unsafe_state, owner);
        }
    }
}
