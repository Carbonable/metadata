const NAME: felt252 = 'SDG09.svg';

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

            data.append(' id=\\"SDG9\\" xmlns=\\"http://w');
            data.append('ww.w3.org/2000/svg\\" viewBox=');
            data.append('\\"0 0 61.85 61.85\\"><rect fil');
            data.append('l=\\"%23f36e24\\" width=\\"61.85');
            data.append('\\" height=\\"61.85\\"/><g fill');
            data.append('=\\"%23fff\\"><path d=\\"M5.74,16');
            data.append('.58A3.29,3.29,0,0,1,5,14.32v-.1');
            data.append('7H7.16a2.58,2.58,0,0,0,.17,1.13');
            data.append('.7.7,0,0,0,.69.34.68.68,0,0,0,.');
            data.append('54-.22,1.53,1.53,0,0,0,.26-.72,');
            data.append('10.76,10.76,0,0,0,.07-1.45V12a1');
            data.append('.22,1.22,0,0,1-.6.51,2.28,2.28,');
            data.append('0,0,1-.94.18,2.08,2.08,0,0,1-1.');
            data.append('91-1,4.76,4.76,0,0,1-.6-2.55q0-');
            data.append('4,3.18-4a2.85,2.85,0,0,1,2.4,1A');
            data.append('4.47,4.47,0,0,1,11.19,9V13.3a5.');
            data.append('35,5.35,0,0,1-.7,3A2.77,2.77,0,');
            data.append('0,1,8,17.33,2.94,2.94,0,0,1,5.7');
            data.append('4,16.58Zm3.15-6.12V8.58A3.15,3.');
            data.append('15,0,0,0,8.7,7.36.67.67,0,0,0,8');
            data.append(',6.91a.67.67,0,0,0-.7.49A4.82,4');
            data.append('.82,0,0,0,7.14,9a11,11,0,0,0,.0');
            data.append('5,1.16,1.23,1.23,0,0,0,.24.64A.');
            data.append('7.7,0,0,0,8,11,1,1,0,0,0,8.89,1');
            data.append('0.46Z\\"/><path d=\\"M13.81,9.8');
            data.append('V5.29h.82V9.8Z\\"/><path d=\\"M');
            data.append('15,9.8V5.29h.58L16.7,7.86V5.29h');
            data.append('.68V9.8h-.54L15.73,7.11V9.8Z\\"');
            data.append('/><path d=\\"M17.78,9.8V5.29h1.');
            data.append('06a2,2,0,0,1,.86.15.86.86,0,0,1');
            data.append(',.44.46,2,2,0,0,1,.13.79V8.34a2');
            data.append('.17,2.17,0,0,1-.13.82.92.92,0,0');
            data.append(',1-.43.48,1.79,1.79,0,0,1-.84.1');
            data.append('6Zm.82-.57h.25a.7.7,0,0,0,.41-.');
            data.append('1.48.48,0,0,0,.15-.3,3,3,0,0,0,');
            data.append('0-.47V6.64a2.45,2.45,0,0,0,0-.4');
            data.append('4A.41.41,0,0,0,19.24,6a.83.83,0');
            data.append(',0,0-.4-.08H18.6Z\\"/><path d=');
            data.append('\\"M21.83,9.86a1.41,1.41,0,0,1-');
            data.append('.78-.18,1,1,0,0,1-.39-.53,2.71,');
            data.append('2.71,0,0,1-.1-.81v-3h.8V8.44a2.');
            data.append('38,2.38,0,0,0,0,.39.46.46,0,0,0');
            data.append(',.13.3.46.46,0,0,0,.62,0,.6.6,0');
            data.append(',0,0,.13-.3,2.38,2.38,0,0,0,0-.');
            data.append('39V5.29h.79V8.34a2.71,2.71,0,0,');
            data.append('1-.1.81,1,1,0,0,1-.38.53A1.45,1');
            data.append('.45,0,0,1,21.83,9.86Z\\"/><path');
            data.append(' d=\\"M24.59,9.86a1.29,1.29,0,0');
            data.append(',1-.68-.16,1,1,0,0,1-.41-.46,1.');
            data.append('89,1.89,0,0,1-.16-.75l.71-.14a2');
            data.append('.05,2.05,0,0,0,.06.46.75.75,0,0');
            data.append(',0,.16.31.4.4,0,0,0,.29.11.31.3');
            data.append('1,0,0,0,.28-.12.5.5,0,0,0,.09-.');
            data.append('31.83.83,0,0,0-.14-.48,2.42,2.4');
            data.append('2,0,0,0-.35-.38l-.57-.5A1.64,1.');
            data.append('64,0,0,1,23.49,7a1.22,1.22,0,0,');
            data.append('1-.14-.63,1.06,1.06,0,0,1,.31-.');
            data.append('82A1.41,1.41,0,0,1,25,5.34a.73.');
            data.append('73,0,0,1,.33.27,1,1,0,0,1,.19.3');
            data.append('9,2.33,2.33,0,0,1,.08.46l-.7.13');
            data.append('a3.53,3.53,0,0,0-.05-.38A.49.49');
            data.append(',0,0,0,24.76,6a.33.33,0,0,0-.27');
            data.append('-.1.35.35,0,0,0-.28.12.49.49,0,');
            data.append('0,0-.1.3.74.74,0,0,0,.1.38,1.43');
            data.append(',1.43,0,0,0,.27.3l.56.49a2.29,2');
            data.append('.29,0,0,1,.48.55,1.43,1.43,0,0,');
            data.append('1,.2.76,1.21,1.21,0,0,1-.14.58,');
            data.append('1.15,1.15,0,0,1-.4.39A1.25,1.25');
            data.append(',0,0,1,24.59,9.86Z\\"/><path d=');
            data.append('\\"M26.36,9.8V5.9h-.72V5.29h2.2');
            data.append('5V5.9h-.7V9.8Z\\"/><path d=\\"M');
            data.append('28,9.8V5.29H29.1a2.46,2.46,0,0,');
            data.append('1,.77.11.85.85,0,0,1,.48.37,1.3');
            data.append('1,1.31,0,0,1,.16.71,2.38,2.38,0');
            data.append(',0,1-.05.49.84.84,0,0,1-.17.37.');
            data.append('83.83,0,0,1-.33.24l.63,2.22h-.8');
            data.append('3l-.54-2.07h-.38V9.8Zm.82-2.58h');
            data.append('.26a1,1,0,0,0,.38-.07.42.42,0,0');
            data.append(',0,.2-.23,1.07,1.07,0,0,0,.06-.');
            data.append('39A.92.92,0,0,0,29.62,6a.59.59,');
            data.append('0,0,0-.48-.17h-.3Z\\"/><path d=');
            data.append('\\"M31.42,9.8V8.08l-.91-2.79h.7');
            data.append('7l.56,1.79.52-1.79h.75l-.9,2.79');
            data.append('V9.8Z\\"/><path d=\\"M33.15,10.');
            data.append('56l-.07-.28a.51.51,0,0,0,.25-.1');
            data.append('6.46.46,0,0,0,.11-.32H33V9.05h.');
            data.append('74v.68a.85.85,0,0,1-.16.56A.72.');
            data.append('72,0,0,1,33.15,10.56Z\\"/><path');
            data.append(' d=\\"M35.13,9.8V5.29h.81V9.8Z');
            data.append('\\"/><path d=\\"M36.34,9.8V5.29');
            data.append('h.58L38,7.86V5.29h.67V9.8h-.54l');
            data.append('-1.1-2.69V9.8Z\\"/><path d=\\"M');
            data.append('39.09,9.8V5.29h.57l1.1,2.57V5.2');
            data.append('9h.68V9.8h-.55l-1.1-2.69V9.8Z\\');
            data.append('"/><path d=\\"M43.06,9.86a1.4,1');
            data.append('.4,0,0,1-.76-.18,1,1,0,0,1-.41-');
            data.append('.51,2.34,2.34,0,0,1-.12-.79V6.6');
            data.append('9a2.28,2.28,0,0,1,.12-.78,1,1,0');
            data.append(',0,1,.41-.5,1.81,1.81,0,0,1,1.5');
            data.append('3,0,1,1,0,0,1,.41.5,2.28,2.28,0');
            data.append(',0,1,.12.78v1.7a2.28,2.28,0,0,1');
            data.append('-.12.78,1,1,0,0,1-.41.51A1.42,1');
            data.append('.42,0,0,1,43.06,9.86Zm0-.61a.47');
            data.append('.47,0,0,0,.3-.08.43.43,0,0,0,.1');
            data.append('3-.25,1.22,1.22,0,0,0,0-.34V6.5');
            data.append('a1.22,1.22,0,0,0,0-.34.38.38,0,');
            data.append('0,0-.13-.23.41.41,0,0,0-.3-.09.');
            data.append('45.45,0,0,0-.3.09.44.44,0,0,0-.');
            data.append('13.23,1.79,1.79,0,0,0,0,.34V8.5');
            data.append('8a1.79,1.79,0,0,0,0,.34.43.43,0');
            data.append(',0,0,.13.25A.51.51,0,0,0,43.06,');
            data.append('9.25Z\\"/><path d=\\"M45.35,9.8');
            data.append('l-.91-4.51h.73l.59,3.19.56-3.19');
            data.append('h.75L46.16,9.8Z\\"/><path d=\\"');
            data.append('M46.84,9.8l.91-4.51h.88l.9,4.51');
            data.append('h-.76l-.18-1H47.8l-.18,1Zm1-1.5');
            data.append('6h.61l-.31-1.9Z\\"/><path d=\\"');
            data.append('M49.93,9.8V5.9h-.72V5.29h2.25V5');
            data.append('.9h-.71V9.8Z\\"/><path d=\\"M51');
            data.append('.6,9.8V5.29h.82V9.8Z\\"/><path');
            data.append(' d=\\"M54.05,9.86a1.4,1.4,0,0,1');
            data.append('-.76-.18,1,1,0,0,1-.41-.51,2.34');
            data.append(',2.34,0,0,1-.12-.79V6.69a2.28,2');
            data.append('.28,0,0,1,.12-.78,1,1,0,0,1,.41');
            data.append('-.5,1.81,1.81,0,0,1,1.53,0,1,1,');
            data.append('0,0,1,.41.5,2.28,2.28,0,0,1,.12');
            data.append('.78v1.7a2.28,2.28,0,0,1-.12.78,');
            data.append('1,1,0,0,1-.41.51A1.42,1.42,0,0,');
            data.append('1,54.05,9.86Zm0-.61a.47.47,0,0,');
            data.append('0,.3-.08.43.43,0,0,0,.13-.25,1.');
            data.append('22,1.22,0,0,0,0-.34V6.5a1.22,1.');
            data.append('22,0,0,0,0-.34.38.38,0,0,0-.13-');
            data.append('.23.41.41,0,0,0-.3-.09.45.45,0,');
            data.append('0,0-.3.09.44.44,0,0,0-.13.23,1.');
            data.append('79,1.79,0,0,0,0,.34V8.58a1.79,1');
            data.append('.79,0,0,0,0,.34.43.43,0,0,0,.13');
            data.append('.25A.51.51,0,0,0,54.05,9.25Z\\"');
            data.append('/><path d=\\"M55.67,9.8V5.29h.5');
            data.append('7l1.1,2.57V5.29H58V9.8h-.55l-1.');
            data.append('1-2.69V9.8Z\\"/><path d=\\"M13.');
            data.append('56,17.17l.91-4.51h.88l.9,4.51h-');
            data.append('.77l-.17-1.05h-.79l-.18,1.05Zm1');
            data.append('-1.57h.62l-.31-1.89Z\\"/><path');
            data.append(' d=\\"M16.46,17.17V12.66H17l1.1');
            data.append(',2.57V12.66h.68v4.51h-.55l-1.1-');
            data.append('2.7v2.7Z\\"/><path d=\\"M19.28,');
            data.append('17.17V12.66h1.06a2,2,0,0,1,.86.');
            data.append('15.86.86,0,0,1,.44.46,2,2,0,0,1');
            data.append(',.13.79v1.65a2.12,2.12,0,0,1-.1');
            data.append('3.81.92.92,0,0,1-.44.49,1.88,1.');
            data.append('88,0,0,1-.83.16Zm.82-.58h.25a.6');
            data.append('5.65,0,0,0,.41-.1.43.43,0,0,0,.');
            data.append('15-.29,3.25,3.25,0,0,0,0-.47V14');
            data.append('a2.68,2.68,0,0,0,0-.44.36.36,0,');
            data.append('0,0-.17-.24.76.76,0,0,0-.39-.08');
            data.append('H20.1Z\\"/><path d=\\"M23.32,17');
            data.append('.17V12.66h.81v4.51Z\\"/><path d');
            data.append('=\\"M24.61,17.17V12.66h.57l1.1,');
            data.append('2.57V12.66H27v4.51h-.55l-1.1-2.');
            data.append('7v2.7Z\\"/><path d=\\"M27.43,17');
            data.append('.17V12.66h1.85v.56h-1v1.32h.84v');
            data.append('.57h-.84v2.06Z\\"/><path d=\\"M');
            data.append('29.49,17.17V12.66h1.08a2.44,2.4');
            data.append('4,0,0,1,.77.1,1,1,0,0,1,.48.37,');
            data.append('1.37,1.37,0,0,1,.17.72,2.46,2.4');
            data.append('6,0,0,1,0,.49,1.05,1.05,0,0,1-.');
            data.append('17.37.71.71,0,0,1-.34.23l.63,2.');
            data.append('23h-.82l-.55-2.07h-.37v2.07Zm.8');
            data.append('3-2.59h.25a.81.81,0,0,0,.38-.07');
            data.append('.38.38,0,0,0,.21-.22,1.07,1.07,');
            data.append('0,0,0,.06-.39.8.8,0,0,0-.13-.51');
            data.append('.56.56,0,0,0-.47-.17h-.3Z\\"/><');
            data.append('path d=\\"M32.17,17.17l.9-4.51H');
            data.append('34l.9,4.51h-.76l-.18-1.05h-.78l');
            data.append('-.19,1.05Zm1-1.57h.61l-.3-1.89Z');
            data.append('\\"/><path d=\\"M36.2,17.23a1.3');
            data.append('9,1.39,0,0,1-.68-.16,1,1,0,0,1-');
            data.append('.41-.47,2,2,0,0,1-.16-.75l.71-.');
            data.append('14a2.72,2.72,0,0,0,.06.46.61.61');
            data.append(',0,0,0,.17.31.34.34,0,0,0,.28.1');
            data.append('1.33.33,0,0,0,.29-.12.56.56,0,0');
            data.append(',0,.08-.3.83.83,0,0,0-.13-.49,2');
            data.append('.07,2.07,0,0,0-.36-.37l-.57-.5a');
            data.append('2,2,0,0,1-.38-.46,1.33,1.33,0,0');
            data.append(',1-.14-.63,1,1,0,0,1,.31-.82,1.');
            data.append('17,1.17,0,0,1,.85-.29,1.36,1.36');
            data.append(',0,0,1,.53.09A1,1,0,0,1,37,13a1');
            data.append('.32,1.32,0,0,1,.18.4,1.7,1.7,0,');
            data.append('0,1,.08.46l-.7.12a2.18,2.18,0,0');
            data.append(',0,0-.38.52.52,0,0,0-.12-.26.4.');
            data.append('4,0,0,0-.27-.09.36.36,0,0,0-.29');
            data.append('.12.49.49,0,0,0-.09.3.7.7,0,0,0');
            data.append(',.09.37,1.81,1.81,0,0,0,.27.31l');
            data.append('.57.49a2.49,2.49,0,0,1,.47.55,1');
            data.append('.41,1.41,0,0,1,.2.76,1.17,1.17,');
            data.append('0,0,1-.14.57,1.1,1.1,0,0,1-.4.4');
            data.append('A1.22,1.22,0,0,1,36.2,17.23Z\\"');
            data.append('/><path d=\\"M38.05,17.17V13.26');
            data.append('h-.72v-.6h2.25v.6h-.71v3.91Z\\"');
            data.append('/><path d=\\"M39.77,17.17V12.66');
            data.append('h1.08a2.51,2.51,0,0,1,.78.1.92.');
            data.append('92,0,0,1,.47.37,1.37,1.37,0,0,1');
            data.append(',.17.72,2.46,2.46,0,0,1-.05.49.');
            data.append('9.9,0,0,1-.17.37.73.73,0,0,1-.3');
            data.append('3.23l.63,2.23h-.83L41,15.1H40.6');
            data.append('v2.07Zm.83-2.59h.25a.88.88,0,0,');
            data.append('0,.39-.07.4.4,0,0,0,.2-.22,1.07');
            data.append(',1.07,0,0,0,.06-.39.8.8,0,0,0-.');
            data.append('13-.51.56.56,0,0,0-.47-.17h-.3Z');
            data.append('\\"/><path d=\\"M43.9,17.23a1.3');
            data.append('6,1.36,0,0,1-.78-.19.88.88,0,0,');
            data.append('1-.38-.52,2.78,2.78,0,0,1-.11-.');
            data.append('81V12.66h.8V15.8a2.5,2.5,0,0,0,');
            data.append('0,.4.59.59,0,0,0,.13.3.38.38,0,');
            data.append('0,0,.31.11.37.37,0,0,0,.31-.11.');
            data.append('59.59,0,0,0,.13-.3,2.5,2.5,0,0,');
            data.append('0,0-.4V12.66h.8v3.05a2.78,2.78,');
            data.append('0,0,1-.11.81.88.88,0,0,1-.38.52');
            data.append('A1.32,1.32,0,0,1,43.9,17.23Z\\"');
            data.append('/><path d=\\"M46.81,17.23A1.36,');
            data.append('1.36,0,0,1,46,17a1.06,1.06,0,0,');
            data.append('1-.39-.53,2.57,2.57,0,0,1-.11-.');
            data.append('78V14.11a2.76,2.76,0,0,1,.11-.8');
            data.append(',1,1,0,0,1,.39-.52,1.45,1.45,0,');
            data.append('0,1,.78-.18,1.47,1.47,0,0,1,.73');
            data.append('.15.86.86,0,0,1,.38.46,2,2,0,0,');
            data.append('1,.11.68v.38h-.79v-.39c0-.12,0-');
            data.append('.24,0-.34a.39.39,0,0,0-.11-.25.');
            data.append('37.37,0,0,0-.29-.09.44.44,0,0,0');
            data.append('-.31.09.49.49,0,0,0-.13.27,2.05');
            data.append(',2.05,0,0,0,0,.37v2a2.15,2.15,0');
            data.append(',0,0,0,.4.42.42,0,0,0,.15.24.44');
            data.append('.44,0,0,0,.28.08.37.37,0,0,0,.2');
            data.append('9-.1.48.48,0,0,0,.11-.26,3.53,3');
            data.append('.53,0,0,0,0-.36v-.4H48v.36a2,2,');
            data.append('0,0,1-.11.71.93.93,0,0,1-.37.48');
            data.append('A1.28,1.28,0,0,1,46.81,17.23Z\\');
            data.append('"/><path d=\\"M48.84,17.17V13.2');
            data.append('6h-.72v-.6h2.25v.6h-.71v3.91Z\\');
            data.append('"/><path d=\\"M51.8,17.23A1.36,');
            data.append('1.36,0,0,1,51,17a.88.88,0,0,1-.');
            data.append('38-.52,2.78,2.78,0,0,1-.11-.81V');
            data.append('12.66h.8V15.8a2.5,2.5,0,0,0,0,.');
            data.append('4.59.59,0,0,0,.13.3.38.38,0,0,0');
            data.append(',.31.11.37.37,0,0,0,.31-.11.59.');
            data.append('59,0,0,0,.13-.3,2.5,2.5,0,0,0,0');
            data.append('-.4V12.66h.8v3.05a2.78,2.78,0,0');
            data.append(',1-.11.81.88.88,0,0,1-.38.52A1.');
            data.append('32,1.32,0,0,1,51.8,17.23Z\\"/><');
            data.append('path d=\\"M53.5,17.17V12.66h1.0');
            data.append('8a2.48,2.48,0,0,1,.77.1,1,1,0,0');
            data.append(',1,.48.37,1.37,1.37,0,0,1,.16.7');
            data.append('2,1.89,1.89,0,0,1-.05.49.9.9,0,');
            data.append('0,1-.17.37.73.73,0,0,1-.33.23l.');
            data.append('63,2.23h-.82L54.7,15.1h-.38v2.0');
            data.append('7Zm.82-2.59h.26a.83.83,0,0,0,.3');
            data.append('8-.07.4.4,0,0,0,.2-.22,1.07,1.0');
            data.append('7,0,0,0,.06-.39.87.87,0,0,0-.12');
            data.append('-.51.58.58,0,0,0-.48-.17h-.3Z\\');
            data.append('"/><path d=\\"M56.39,17.17V12.6');
            data.append('6h1.9v.58H57.22v1.29h.84v.58h-.');
            data.append('84V16.6H58.3v.57Z\\"/><path d=');
            data.append('\\"M46.8,40.7l-7.39-4.26V27.91a');
            data.append('.5.5,0,0,0-.25-.44l-7.64-4.41a.');
            data.append('5.5,0,0,0-.5,0l-7.64,4.41a.52.5');
            data.append('2,0,0,0-.25.44v8.53L15.75,40.7a');
            data.append('.51.51,0,0,0-.26.44V50a.49.49,0');
            data.append(',0,0,.26.43l7.63,4.41a.48.48,0,');
            data.append('0,0,.26.07.47.47,0,0,0,.25-.07l');
            data.append('7.38-4.26,7.39,4.26a.48.48,0,0,');
            data.append('0,.5,0l7.64-4.41a.48.48,0,0,0,.');
            data.append('25-.43V41.14A.5.5,0,0,0,46.8,40');
            data.append('.7Zm-16,8.38-6.13-3.53L30.77,42');
            data.append('ZM37.9,36.73l-6.12,3.53V33.19Zm');
            data.append('-7.13,3.53-6.13-3.53,6.13-3.54Z');
            data.append('m1.51.88,6.63-3.83,6.63,3.83L38');
            data.append('.91,45Zm6.13-5.28-6.13-3.54,6.1');
            data.append('3-3.54Zm-8.14-3.54-6.13,3.54V28');
            data.append('.78ZM23.13,53.49,16.5,49.67V42l');
            data.append('6.63,3.83Zm1,0V46.42L30.27,50ZM');
            data.append('46,49.67l-6.63,3.82V45.84L46,42');
            data.append('Z\\"/></g></svg>');

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
    #[available_gas(1988000)]
    fn test_component_get() {
        let mut calldata: Array<felt252> = Default::default();
        let props: svg::Properties = Default::default();
        let mut props_se: Array<felt252> = Default::default();
        props.serialize(ref props_se);
        let args_props: Option<Span<felt252>> = Option::Some(props_se.span());
        args_props.serialize(ref calldata);
        let data: Span<felt252> = Component::__external::render(calldata.span());
        // data.len().print();
        assert_eq(@data.len(), @284_u32, 'Couldn\'t get data');
    }
}
