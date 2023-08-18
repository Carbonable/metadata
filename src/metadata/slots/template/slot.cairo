use array::ArrayTrait;

#[inline(always)]
fn generate_slot_uri(slot: u256, data: felt252) -> Span<felt252> {
    let mut uri: Array<felt252> = Default::default();
    uri.append('https://');
    uri.append('www.');
    uri.append('example.com/');

    uri.span()
}
