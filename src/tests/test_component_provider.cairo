use debug::PrintTrait;
use array::{ArrayTrait, SpanTrait};
use result::ResultTrait;

use starknet::{
    contract_address_const, ContractAddress, Felt252TryIntoContractAddress, TryInto, Into,
    OptionTrait, class_hash::Felt252TryIntoClassHash
};
use starknet::testing::{set_caller_address, set_contract_address};
use starknet::syscalls::deploy_syscall;

use test::test_utils::assert_eq;

use metadata::components::provider::ComponentProvider;
use metadata::components::component::carbonable_logo::Component as CarbonableLogo;
use metadata::interfaces::component_provider::{
    IComponentProviderDispatcher, IComponentProviderDispatcherTrait
};
use metadata::interfaces::component::{IComponentDispatcherTrait, IComponentLibraryDispatcher};

use metadata::tests::utils;

fn setup() -> (IComponentProviderDispatcher, ContractAddress) {
    let account: ContractAddress = contract_address_const::<1>();
    set_caller_address(account);

    let provider = IComponentProviderDispatcher {
        contract_address: utils::contracts::deploy(
            ComponentProvider::TEST_CLASS_HASH, ArrayTrait::new()
        )
    };

    (provider, account)
}

#[test]
#[available_gas(2500000)]
fn test_component_provider() {
    let gas_start = utils::tests::start_gas_meter();

    let (provider, account) = setup();
    provider.register('carbonable_logo', CarbonableLogo::TEST_CLASS_HASH.try_into().unwrap());

    let logo_component: IComponentLibraryDispatcher = provider.get('carbonable_logo');
    let logo: Span<felt252> = logo_component.get().span();

    assert_eq(@logo.len(), @60_u32, 'Failed to get component');

    utils::tests::stop_gas_meter(gas_start);
}
