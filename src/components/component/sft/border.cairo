const NAME: felt252 = 'SFT.Border.svg';

use metadata::metadata::common::models::{Shortstring, String};

#[derive(Serde, Drop, Copy)]
enum Gradient {
    Linear,
    Radial,
}

#[derive(Serde, Drop, Copy)]
struct Properties {
    x: Option<usize>,
    y: Option<usize>,
    stroke: Gradient,
    stroke_opacity: Shortstring,
    stops: Span<(felt252, felt252)>
}

impl DefaultProperties of Default<Properties> {
    fn default() -> Properties {
        Properties {
            x: Option::None,
            y: Option::None,
            stroke: Gradient::Linear,
            stroke_opacity: '0.8',
            stops: array![('0', '000000'), ('1', 'ffffff')].span(),
        }
    }
}

#[starknet::contract]
mod Component {
    use core::array::ArrayTrait;
    use alexandria_ascii::ToAsciiTrait;

    use metadata::metadata::common::utils::ArrayConcat;
    use metadata::interfaces::component::IComponent;
    use super::{Properties, Gradient};


    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: Properties = self.parse_properties(args);

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

            data.append(' ><rect width=\\"');
            data.append('312\\" height=\\"356\\" x=\\"2');
            data.append('\\" y=\\"2\\" stroke=\\"url(#border');
            data.append(')\\" stroke-linejoin=\\"round\\"');
            data.append(' stroke-opacity=\\"');
            data.append(props.stroke_opacity);
            data.append('\\" stroke');
            data.append('-width=\\"4\\" rx=\\"14\\"/>');
            data.append('<defs>');

            match props.stroke {
                Gradient::Linear => {
                    data.append('<linearGradient id=\\"border\\"');
                    data.append(' x1=\\"0\\" x2=\\"1\\" y1=\\"0');
                    data.append('\\" y2=\\"0\\">');
                },
                Gradient::Radial => {
                    data.append('<radialGradient id=\\"border\\"');
                    data.append(' cx=\\"0\\" cy=\\"0\\" r=\\"1.7\\"');
                    data.append(' gradientTransform=\\"matrix(0 1');
                    data.append('76 -149.38 0 153.38 180)\\" grad');
                    data.append('ientUnits=\\"userSpaceOnUse\\">');
                },
            }

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

            match props.stroke {
                Gradient::Linear => {
                    data.append('</linearGradient>');
                },
                Gradient::Radial => {
                    data.append('</radialGradient>');
                },
            }

            data.append('</defs></svg>');

            data
        }
    }

    #[generate_trait]
    impl HelperImpl of HelperTrait {
        fn parse_properties(self: @ContractState, args: Option<Span<felt252>>) -> Properties {
            let props: Properties = match args {
                Option::Some(props) => {
                    let mut props = props;
                    Serde::<Properties>::deserialize(ref props)
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

    use super::{Component, Properties};

    use metadata::tests::utils;

    #[test]
    #[available_gas(15_000)]
    fn test_component_name() {
        let data: Span<felt252> = Component::__external::name(Default::default().span());
        let name: felt252 = *data[0];
        assert_eq(@name, @super::NAME, 'Couldn\'t get name');
    }

    #[test]
    #[available_gas(520_000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());

        // utils::tests::print_felt_span(data);

        assert_eq(@data.len(), @0x1a_u32, 'Couldn\'t get data');
        let mut arr: Array<felt252> = ArrayTrait::new();
    }
}
