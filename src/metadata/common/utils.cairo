use array::ArrayTrait;
use alexandria_ascii::interger::ToAsciiTrait;

trait ToSpanOption {
    fn to_span(self: felt252) -> Option<Span<felt252>>;
}

impl ToSpanOptionTrait of ToSpanOption {
    #[inline(always)]
    fn to_span(self: felt252) -> Option<Span<felt252>> {
        Option::Some(array![self].span())
    }
}

fn to_ascii<T, impl TDrop: Drop<T>, impl TToAsciiTrait: ToAsciiTrait<T, Array<felt252>>>(
    x: T
) -> Span<felt252> {
    let res: Array<felt252> = x.to_ascii();
    res.span()
}
// #[inline(always)]
// fn to_ascii(x: u128) -> Span<felt252> {
//     let res: Array<felt252> = x.to_ascii();
//     res.span()
// }


