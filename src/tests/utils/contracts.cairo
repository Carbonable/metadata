use array::ArrayTrait;
use core::result::ResultTrait;
use option::OptionTrait;
use starknet::class_hash::Felt252TryIntoClassHash;
use starknet::ContractAddress;
use traits::TryInto;

#[inline(always)]
fn deploy(class_hash: felt252, calldata: Array<felt252>) -> ContractAddress {
    let (address, _) = starknet::deploy_syscall(
        class_hash.try_into().unwrap(), 0, calldata.span(), false
    )
        .unwrap();
    address
}
