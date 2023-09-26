use debug::PrintTrait;

use starknet::{contract_address_const, ContractAddress};
use starknet::testing::{set_caller_address, set_contract_address};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::components::provider::ComponentProvider;
use metadata::components::component::logos::carbonable::Component as CarbonableLogo;
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::component::{IComponentDispatcherTrait, IComponentLibraryDispatcher};

use metadata::tests::utils;

fn setup() -> (IComponentProviderDispatcher, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let mut calldata: Array<felt252> = Default::default();
    let owner = utils::contracts::owner();
    owner.serialize(ref calldata);

    let provider = IComponentProviderDispatcher {
        contract_address: utils::contracts::deploy(ComponentProvider::TEST_CLASS_HASH, calldata)
    };

    (provider, account)
}

#[test]
#[available_gas(2500000)]
fn test_component_provider() {
    let (provider, account) = setup();

    set_contract_address(utils::contracts::owner());
    provider.register(CarbonableLogo::TEST_CLASS_HASH.try_into().unwrap());

    let logo_component: IComponentLibraryDispatcher = provider.get('logo.Carbonable.svg').unwrap();
    let logo: Span<felt252> = logo_component.render(Option::None).span();

    assert_eq(@logo.len(), @60_u32, 'Failed to get component');
}
