use starknet::ContractAddress;

#[inline(always)]
fn as_addr(v: felt252) -> ContractAddress {
    starknet::contract_address::contract_address_try_from_felt252(v).unwrap()
}

#[inline(always)]
fn owner() -> ContractAddress {
    as_addr('owner')
}

#[inline(always)]
fn deploy(class_hash: felt252, calldata: Array<felt252>) -> ContractAddress {
    let (address, _) = starknet::deploy_syscall(
        class_hash.try_into().unwrap(), 0, calldata.span(), false
    )
        .unwrap();
    address
}
