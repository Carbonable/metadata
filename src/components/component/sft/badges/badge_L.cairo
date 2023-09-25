const NAME: felt252 = 'SFT.BadgeL.svg';

#[starknet::contract]
mod Component {
    use metadata::interfaces::component::IComponent;
    use metadata::components::configs::svg;

    #[storage]
    struct Storage {}

    #[external(v0)]
    impl ComponentImpl of IComponent<ContractState> {
        fn name(self: @ContractState) -> felt252 {
            super::NAME
        }

        fn render(self: @ContractState, args: Option<Span<felt252>>) -> Array<felt252> {
            let props: svg::Properties = svg::parse_properties(args);

            let mut data: Array<felt252> = Default::default();
            svg::add_header_helper(props, ref data);

            data.append(' width=\\"40\\" height=\\"45\\"');
            data.append(' viewBox=\\"0 0 40 45\\" fill=');
            data.append('\\"none\\" xmlns=\\"http://www.');
            data.append('w3.org/2000/svg\\"><g clip-path');
            data.append('=\\"url(#clip0_large)\\"><g fil');
            data.append('ter=\\"url(#filter0_b_large)\\"');
            data.append('><path d=\\"M17.6784 1.25982C19');
            data.append('.131 0.471559 20.8793 0.45204 2');
            data.append('2.3492 1.20768L29.2683 4.76471L');
            data.append('37.3761 9.14371C38.9925 10.0167');
            data.append(' 40 11.7059 40 13.5431V22.2353V');
            data.append('30.7341C40 32.5333 39.0333 34.1');
            data.append('939 37.4686 35.0822L22.4686 43.');
            data.append('5984C20.9377 44.4677 19.0624 44');
            data.append('.4677 17.5314 43.5984L2.53137 3');
            data.append('5.0822C0.966714 34.1939 0 32.53');
            data.append('34 0 30.7341V22.2353V13.6056C0');
            data.append(' 11.7355 1.0436 10.0217 2.70508');
            data.append(' 9.1634L11.2195 4.76471L17.6784');
            data.append(' 1.25982Z\\" fill=\\"#D0D1D6\\"');
            data.append(' fill-opacity=\\"0.2\\"/></g><m');
            data.append('ask id=\\"path-2-inside-1_large');
            data.append('\\" fill=\\"white\\"><path d=\\');
            data.append('"M18.1161 3.97613C19.2922 3.326');
            data.append(' 20.7163 3.30994 21.9068 3.9333');
            data.append('7L27.9119 7.07804L35.0012 10.97');
            data.append('83C36.2792 11.6814 37.0731 13.0');
            data.append('244 37.0731 14.4829V22.2699V29.');
            data.append('8839C37.0731 31.3119 36.3118 32');
            data.append('.6316 35.0756 33.3465L22.0025 4');
            data.append('0.9071C20.7636 41.6236 19.2363');
            data.append(' 41.6236 17.9974 40.9071L4.9242');
            data.append('2 33.3465C3.68804 32.6316 2.926');
            data.append('76 31.3119 2.92676 29.8839V22.2');
            data.append('699V14.5333C2.92676 13.0481 3.7');
            data.append('4966 11.6851 5.06398 10.9935L12');
            data.append('.5044 7.07804L18.1161 3.97613Z');
            data.append('\\"/></mask><path d=\\"M18.1161');
            data.append(' 3.97613C19.2922 3.326 20.7163');
            data.append(' 3.30994 21.9068 3.93337L27.911');
            data.append('9 7.07804L35.0012 10.9783C36.27');
            data.append('92 11.6814 37.0731 13.0244 37.0');
            data.append('731 14.4829V22.2699V29.8839C37.');
            data.append('0731 31.3119 36.3118 32.6316 35');
            data.append('.0756 33.3465L22.0025 40.9071C2');
            data.append('0.7636 41.6236 19.2363 41.6236');
            data.append(' 17.9974 40.9071L4.92422 33.346');
            data.append('5C3.68804 32.6316 2.92676 31.31');
            data.append('19 2.92676 29.8839V22.2699V14.5');
            data.append('333C2.92676 13.0481 3.74966 11.');
            data.append('6851 5.06398 10.9935L12.5044 7.');
            data.append('07804L18.1161 3.97613Z\\" fill=');
            data.append('\\"url(#paint0_angular_large)\\');
            data.append('" fill-opacity=\\"0.15\\" strok');
            data.append('e=\\"url(#paint1_angular_large)');
            data.append('\\" stroke-width=\\"3\\" mask=');
            data.append('\\"url(#path-2-inside-1_large)');
            data.append('\\"/><mask id=\\"mask0_large\\"');
            data.append(' style=\\"mask-type:alpha\\" ma');
            data.append('skUnits=\\"userSpaceOnUse\\" x=');
            data.append('\\"0\\" y=\\"0\\" width=\\"40\\');
            data.append('" height=\\"46\\"><path d=\\"M2');
            data.append('0 0.000732528L29.2683 4.76544L4');
            data.append('0 10.5616L40 22.236L40 33.6457L');
            data.append('20 45.0007L-1.78451e-07 33.6457');
            data.append('L-1.17935e-07 22.236L-5.60143e-');
            data.append('08 10.5616L11.2195 4.76544L20 0');
            data.append('.000732528Z\\" fill=\\"#E1E7EA');
            data.append('\\"/></mask><g mask=\\"url(#mas');
            data.append('k0_large)\\"><rect opacity=\\"0');
            data.append('.1\\" width=\\"47.8878\\" heigh');
            data.append('t=\\"22.3042\\" transform=\\"ma');
            data.append('trix(0.600773 -0.799419 0.79785');
            data.append(' 0.602857 5.2915 41.7463)\\" fi');
            data.append('ll=\\"#191A20\\"/></g><text fil');
            data.append('l=\\"#EBECF0\\" xml:space=\\"pr');
            data.append('eserve\\" style=\\"white-space:');
            data.append(' pre\\" font-family=\\"Inter\\"');
            data.append(' font-size=\\"15\\" font-weight');
            data.append('=\\"bold\\" letter-spacing=\\"0');
            data.append('em\\"><tspan x=\\"15.7446\\" y=');
            data.append('\\"28.4545\\">L</tspan></text><');
            data.append('/g><defs><filter id=\\"filter0_');
            data.append('b_large\\" x=\\"-4\\" y=\\"-3.3');
            data.append('4552\\" width=\\"48\\" height=');
            data.append('\\"51.5959\\" filterUnits=\\"us');
            data.append('erSpaceOnUse\\" color-interpola');
            data.append('tion-filters=\\"sRGB\\"><feFloo');
            data.append('d flood-opacity=\\"0\\" result=');
            data.append('\\"BackgroundImageFix\\"/><feGa');
            data.append('ussianBlur in=\\"BackgroundImag');
            data.append('eFix\\" stdDeviation=\\"2\\"/><');
            data.append('feComposite in2=\\"SourceAlpha');
            data.append('\\" operator=\\"in\\" result=\\');
            data.append('"effect1_backgroundBlur_large\\');
            data.append('"/><feBlend mode=\\"normal\\" i');
            data.append('n=\\"SourceGraphic\\" in2=\\"ef');
            data.append('fect1_backgroundBlur_large\\" r');
            data.append('esult=\\"shape\\"/></filter><ra');
            data.append('dialGradient id=\\"paint0_angul');
            data.append('ar_large\\" cx=\\"0\\" cy=\\"0');
            data.append('\\" r=\\"1.5\\" gradientUnits=');
            data.append('\\"userSpaceOnUse\\" gradientTr');
            data.append('ansform=\\"translate(19.5 22.5)');
            data.append(' rotate(90) scale(19.5 19.5)\\"');
            data.append('><stop offset=\\"0.0821133\\" s');
            data.append('top-color=\\"#DEB69C\\"/><stop');
            data.append(' offset=\\"0.229167\\" stop-col');
            data.append('or=\\"#FFECE0\\"/><stop offset=');
            data.append('\\"0.4024\\" stop-color=\\"#FFE');
            data.append('CE0\\"/><stop offset=\\"0.50551');
            data.append('2\\" stop-color=\\"#F0CAB2\\"/>');
            data.append('<stop offset=\\"0.570198\\" sto');
            data.append('p-color=\\"#775C50\\"/><stop of');
            data.append('fset=\\"0.604313\\" stop-color=');
            data.append('\\"#55372C\\"/><stop offset=\\"');
            data.append('0.712516\\" stop-color=\\"#7A58');
            data.append('43\\"/><stop offset=\\"0.802149');
            data.append('\\" stop-color=\\"#F0CAB2\\"/><');
            data.append('stop offset=\\"0.921875\\" stop');
            data.append('-color=\\"#54372B\\"/></radialG');
            data.append('radient><radialGradient id=\\"p');
            data.append('aint1_angular_large\\" cx=\\"0');
            data.append('\\" cy=\\"0\\" r=\\"1.7\\" grad');
            data.append('ientUnits=\\"userSpaceOnUse\\"');
            data.append(' gradientTransform=\\"translate');
            data.append('(19.5 22.5) rotate(90) scale(19');
            data.append('.5 19.5)\\"><stop offset=\\"0.0');
            data.append('821133\\" stop-color=\\"#DEB69C');
            data.append('\\"/><stop offset=\\"0.229167\\');
            data.append('" stop-color=\\"#FFECE0\\"/><st');
            data.append('op offset=\\"0.4024\\" stop-col');
            data.append('or=\\"#FFECE0\\"/><stop offset=');
            data.append('\\"0.505512\\" stop-color=\\"#F');
            data.append('0CAB2\\"/><stop offset=\\"0.570');
            data.append('198\\" stop-color=\\"#775C50\\"');
            data.append('/><stop offset=\\"0.604313\\" s');
            data.append('top-color=\\"#55372C\\"/><stop');
            data.append(' offset=\\"0.712516\\" stop-col');
            data.append('or=\\"#7A5843\\"/><stop offset=');
            data.append('\\"0.802149\\" stop-color=\\"#F');
            data.append('0CAB2\\"/><stop offset=\\"0.921');
            data.append('875\\" stop-color=\\"#54372B\\"');
            data.append('/></radialGradient><clipPath id');
            data.append('=\\"clip0_large\\"><rect width=');
            data.append('\\"40\\" height=\\"45\\" fill=');
            data.append('\\"white\\"/></clipPath></defs>');
            data.append('</svg>');

            data
        }
    }
}

#[cfg(test)]
mod test {
    use debug::PrintTrait;

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
    #[available_gas(1050000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @150_u32, 'Couldn\'t get data');
    }
}
