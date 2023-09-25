const NAME: felt252 = 'SFT.BadgeXL.svg';

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
            data.append('=\\"url(#clip0_xlarge)\\"><g fi');
            data.append('lter=\\"url(#filter0_b_xlarge)');
            data.append('\\"><path d=\\"M17.6784 1.25982');
            data.append('C19.131 0.471559 20.8793 0.4520');
            data.append('4 22.3492 1.20768L29.2683 4.764');
            data.append('71L37.3761 9.14371C38.9925 10.0');
            data.append('167 40 11.7059 40 13.5431V22.23');
            data.append('53V30.7341C40 32.5333 39.0333 3');
            data.append('4.1939 37.4686 35.0822L22.4686');
            data.append(' 43.5984C20.9377 44.4677 19.062');
            data.append('4 44.4677 17.5314 43.5984L2.531');
            data.append('37 35.0822C0.966714 34.1939 0 3');
            data.append('2.5334 0 30.7341V22.2353V13.605');
            data.append('6C0 11.7355 1.0436 10.0217 2.70');
            data.append('508 9.1634L11.2195 4.76471L17.6');
            data.append('784 1.25982Z\\" fill=\\"#D0D1D6');
            data.append('\\" fill-opacity=\\"0.2\\"/></g');
            data.append('><mask id=\\"path-2-inside-1_xl');
            data.append('arge\\" fill=\\"white\\"><path');
            data.append(' d=\\"M18.1161 3.97613C19.2922');
            data.append(' 3.326 20.7163 3.30994 21.9068');
            data.append(' 3.93337L27.9119 7.07804L35.001');
            data.append('2 10.9783C36.2792 11.6814 37.07');
            data.append('31 13.0244 37.0731 14.4829V22.2');
            data.append('699V29.8839C37.0731 31.3119 36.');
            data.append('3118 32.6316 35.0756 33.3465L22');
            data.append('.0025 40.9071C20.7636 41.6236 1');
            data.append('9.2363 41.6236 17.9974 40.9071L');
            data.append('4.92422 33.3465C3.68804 32.6316');
            data.append(' 2.92676 31.3119 2.92676 29.883');
            data.append('9V22.2699V14.5333C2.92676 13.04');
            data.append('81 3.74966 11.6851 5.06398 10.9');
            data.append('935L12.5044 7.07804L18.1161 3.9');
            data.append('7613Z\\"/></mask><path d=\\"M18');
            data.append('.1161 3.97613C19.2922 3.326 20.');
            data.append('7163 3.30994 21.9068 3.93337L27');
            data.append('.9119 7.07804L35.0012 10.9783C3');
            data.append('6.2792 11.6814 37.0731 13.0244');
            data.append(' 37.0731 14.4829V22.2699V29.883');
            data.append('9C37.0731 31.3119 36.3118 32.63');
            data.append('16 35.0756 33.3465L22.0025 40.9');
            data.append('071C20.7636 41.6236 19.2363 41.');
            data.append('6236 17.9974 40.9071L4.92422 33');
            data.append('.3465C3.68804 32.6316 2.92676 3');
            data.append('1.3119 2.92676 29.8839V22.2699V');
            data.append('14.5333C2.92676 13.0481 3.74966');
            data.append(' 11.6851 5.06398 10.9935L12.504');
            data.append('4 7.07804L18.1161 3.97613Z\\" f');
            data.append('ill=\\"url(#paint0_angular_xlar');
            data.append('ge)\\" fill-opacity=\\"0.15\\"');
            data.append(' stroke=\\"url(#paint1_angular_');
            data.append('xlarge)\\" stroke-width=\\"3\\"');
            data.append(' mask=\\"url(#path-2-inside-1_x');
            data.append('large)\\"/><mask id=\\"mask0_xl');
            data.append('arge\\" style=\\"mask-type:alph');
            data.append('a\\" maskUnits=\\"userSpaceOnUs');
            data.append('e\\" x=\\"0\\" y=\\"0\\" width=');
            data.append('\\"40\\" height=\\"46\\"><path');
            data.append(' d=\\"M20 0.000732528L29.2683 4');
            data.append('.76544L40 10.5616L40 22.236L40');
            data.append(' 33.6457L20 45.0007L-1.78451e-0');
            data.append('7 33.6457L-1.17935e-07 22.236L-');
            data.append('5.60143e-08 10.5616L11.2195 4.7');
            data.append('6544L20 0.000732528Z\\" fill=\\');
            data.append('"#E1E7EA\\"/></mask><g mask=\\"');
            data.append('url(#mask0_xlarge)\\"><rect opa');
            data.append('city=\\"0.1\\" width=\\"47.8878');
            data.append('\\" height=\\"22.3042\\" transf');
            data.append('orm=\\"matrix(0.600773 -0.79941');
            data.append('9 0.79785 0.602857 5.2915 41.74');
            data.append('63)\\" fill=\\"#191A20\\"/></g>');
            data.append('<text fill=\\"#EBECF0\\" xml:sp');
            data.append('ace=\\"preserve\\" style=\\"whi');
            data.append('te-space: pre\\" font-family=\\');
            data.append('"Inter\\" font-size=\\"15\\" fo');
            data.append('nt-weight=\\"bold\\" letter-spa');
            data.append('cing=\\"0em\\"><tspan x=\\"10.3');
            data.append('833\\" y=\\"28.4545\\">XL</tspa');
            data.append('n></text></g><defs><filter id=');
            data.append('\\"filter0_b_xlarge\\" x=\\"-4');
            data.append('\\" y=\\"-3.34552\\" width=\\"4');
            data.append('8\\" height=\\"51.5959\\" filte');
            data.append('rUnits=\\"userSpaceOnUse\\" col');
            data.append('or-interpolation-filters=\\"sRG');
            data.append('B\\">');
            data.append('<feGaussianBlur stdDeviation=\\');
            data.append('"2\\"/><feComposite in2=\\"Sour');
            data.append('ceAlpha\\" operator=\\"in\\" re');
            data.append('sult=\\"effect1_backgroundBlur_');
            data.append('xlarge\\"/><feBlend mode=\\"nor');
            data.append('mal\\" in=\\"SourceGraphic\\" i');
            data.append('n2=\\"effect1_backgroundBlur_xl');
            data.append('arge\\" result=\\"shape\\"/></f');
            data.append('ilter><radialGradient id=\\"pai');
            data.append('nt0_angular_xlarge\\" cx=\\"0\\');
            data.append('" cy=\\"0\\" r=\\"1.6\\" gradie');
            data.append('ntUnits=\\"userSpaceOnUse\\" gr');
            data.append('adientTransform=\\"translate(19');
            data.append('.5 22.5) rotate(90) scale(19.5');
            data.append(' 19.5)\\"><stop offset=\\"0.072');
            data.append('9167\\" stop-color=\\"#FBFBFD\\');
            data.append('"/><stop offset=\\"0.244792\\"');
            data.append(' stop-color=\\"#C8D4DA\\"/><sto');
            data.append('p offset=\\"0.434957\\" stop-co');
            data.append('lor=\\"white\\"/><stop offset=');
            data.append('\\"0.532623\\" stop-color=\\"#9');
            data.append('EB9CD\\"/><stop offset=\\"0.658');
            data.append('692\\" stop-color=\\"#E3E9EE\\"');
            data.append('/><stop offset=\\"0.708863\\" s');
            data.append('top-color=\\"#FAFBFC\\"/><stop');
            data.append(' offset=\\"0.861413\\" stop-col');
            data.append('or=\\"#D6DFE6\\"/><stop offset=');
            data.append('\\"0.921875\\" stop-color=\\"#A');
            data.append('7C1D0\\"/></radialGradient><rad');
            data.append('ialGradient id=\\"paint1_angula');
            data.append('r_xlarge\\" cx=\\"0\\" cy=\\"0');
            data.append('\\" r=\\"1.7\\" gradientUnits=');
            data.append('\\"userSpaceOnUse\\" gradientTr');
            data.append('ansform=\\"translate(19.5 22.5)');
            data.append(' rotate(90) scale(19.5 19.5)\\"');
            data.append('><stop offset=\\"0.0729167\\" s');
            data.append('top-color=\\"#FBFBFD\\"/><stop');
            data.append(' offset=\\"0.244792\\" stop-col');
            data.append('or=\\"#C8D4DA\\"/><stop offset=');
            data.append('\\"0.434957\\" stop-color=\\"wh');
            data.append('ite\\"/><stop offset=\\"0.53262');
            data.append('3\\" stop-color=\\"#9EB9CD\\"/>');
            data.append('<stop offset=\\"0.658692\\" sto');
            data.append('p-color=\\"#E3E9EE\\"/><stop of');
            data.append('fset=\\"0.708863\\" stop-color=');
            data.append('\\"#FAFBFC\\"/><stop offset=\\"');
            data.append('0.861413\\" stop-color=\\"#D6DF');
            data.append('E6\\"/><stop offset=\\"0.921875');
            data.append('\\" stop-color=\\"#A7C1D0\\"/><');
            data.append('/radialGradient><clipPath id=\\');
            data.append('"clip0_xlarge\\"><rect width=\\');
            data.append('"40\\" height=\\"45\\" fill=\\"');
            data.append('white\\"/></clipPath></defs></s');
            data.append('vg>');

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
    #[available_gas(1015000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @145_u32, 'Couldn\'t get data');
    }
}
