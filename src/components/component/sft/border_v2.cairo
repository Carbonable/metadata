const NAME: felt252 = 'SFT.Border.v2.svg';

use metadata::metadata::common::models::{Shortstring, String};

#[derive(Serde, Drop, Copy)]
struct Properties {
    x: Option<usize>,
    y: Option<usize>,
    stroke_opacity: Shortstring,
    x1: Shortstring,
    x2: Shortstring,
    y1: Shortstring,
    y2: Shortstring,
    stops: Span<(felt252, felt252)>
}

impl DefaultProperties of Default<Properties> {
    fn default() -> Properties {
        Properties {
            x: Option::None,
            y: Option::None,
            stroke_opacity: '0.8',
            x1: '0',
            x2: '0',
            y1: '300',
            y2: '300',
            stops: array![('0', '000000'), ('1', 'ffffff')].span(),
        }
    }
}

#[starknet::contract]
mod Component {
    use array::ArrayTrait;
    use metadata::interfaces::component::IComponent;
    use metadata::components::configs::svg;

    use alexandria_ascii::ToAsciiTrait;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: super::Properties = self.parse_properties(args);

            let mut data: Array<felt252> = Default::default();

            data.append('<svg');
            match props.x {
                Option::Some(x) => {
                    data.append(' x=\\"');
                    data.append(x.to_ascii());
                    data.append('\\"');
                },
                Option::None => (),
            }
            match props.y {
                Option::Some(y) => {
                    data.append(' y=\\"');
                    data.append(y.to_ascii());
                    data.append('\\"');
                },
                Option::None => (),
            }

            data.append('><rect width=\\"312\\" height=\\');
            data.append('"356\\" x=\\"2\\" y=\\"2\\" str');
            data.append('oke=\\"url(#border_gradient)\\"');
            data.append(' stroke-linejoin=\\"round\\" st');
            data.append('roke-opacity=\\"');
            data.append(props.stroke_opacity);
            data.append('\\" stroke-width=\\"4\\" rx=\\"');
            data.append('14\\"/><defs><linearGradient id');
            data.append('=\\"border_gradient\\" x1=\\"');
            data.append(props.x1);
            data.append('\\" x2=\\"');
            data.append(props.x2);
            data.append('\\" y1=\\"');
            data.append(props.y1);
            data.append('\\" y2=\\"');
            data.append(props.y2);
            data.append('\\" gradientUnits=\\"userSpaceO');
            data.append('nUse\\">');

            let mut stops = props.stops;
            loop {
                match stops.pop_front() {
                    Option::Some((
                        offset, color
                    )) => {
                        data.append('<stop offset=\\"');
                        data.append(*offset);
                        data.append('\\" stop-color=\\"');
                        data.append(*color);
                        data.append('\\"/>');
                    },
                    Option::None => {
                        break;
                    }
                };
            };

            data.append('</linearGradient></defs></svg>');

            data
        }
    }

    #[generate_trait]
    impl HelperImpl of HelperTrait {
        fn parse_properties(
            self: @ContractState, args: Option<Span<felt252>>
        ) -> super::Properties {
            let props: super::Properties = match args {
                Option::Some(props) => {
                    let mut props = props;
                    Serde::<super::Properties>::deserialize(ref props)
                        .expect('Couldn\'t deserialize properties')
                },
                Option::None => Default::default(),
            };
            props
        }
    }
}

#[cfg(test)]
mod test {
    use array::{ArrayTrait, SpanTrait};
    use debug::PrintTrait;
    use traits::Into;

    use test::test_utils::assert_eq;

    use super::Component;
    use metadata::components::configs::svg;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(600_000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: super::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        data.len().print();
        assert_eq(@data.len(), @31_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
