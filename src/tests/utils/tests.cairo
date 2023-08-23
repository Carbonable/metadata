use array::{ArrayTrait, SpanTrait};
use debug::PrintTrait;
use starknet::syscalls::deploy_syscall;
use starknet::{
    ContractAddress, Felt252TryIntoContractAddress, TryInto, Into, OptionTrait,
    class_hash::Felt252TryIntoClassHash
};
use result::ResultTrait;

use metadata::interfaces::component_provider::{IComponentProviderDispatcher};
use metadata::components::provider::ComponentProvider;

use metadata::tests::mocks::project::ProjectMock;

#[inline(always)]
fn deploy_project_mock() -> ContractAddress {
    let (address, _) = deploy_syscall(
        ProjectMock::TEST_CLASS_HASH.try_into().unwrap(), 0, Default::default().span(), false
    )
        .unwrap();

    address
}

#[inline(always)]
fn deploy_component_provider() -> IComponentProviderDispatcher {
    let (address, _) = deploy_syscall(
        ComponentProvider::TEST_CLASS_HASH.try_into().unwrap(), 0, ArrayTrait::new().span(), false
    )
        .unwrap();

    return IComponentProviderDispatcher { contract_address: address };
}

fn print_felt_span(a: Span<felt252>) {
    let mut a: Span<felt252> = a;
    match a.pop_front() {
        Option::Some(value) => {
            (*value).print();
            print_felt_span(a);
        },
        Option::None(()) => {}
    }
}

#[inline(always)]
fn start_gas_meter() -> u128 {
    let gas_start = testing::get_available_gas();
    gas::withdraw_gas().unwrap();
    gas_start
}

#[inline(always)]
fn stop_gas_meter(gas_start: u128) {
    'total gas used: '.print();
    let gas_now = testing::get_available_gas();
    gas::withdraw_gas().unwrap(); // needed?
    (gas_start - gas_now).print();
}
