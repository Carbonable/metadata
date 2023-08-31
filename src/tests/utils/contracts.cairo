use starknet::ContractAddress;

#[inline(always)]
fn deploy(class_hash: felt252, calldata: Array<felt252>) -> ContractAddress {
    let (address, _) = starknet::deploy_syscall(
        class_hash.try_into().unwrap(), 0, calldata.span(), false
    )
        .unwrap();
    address
}
