// import 'package:az_admin/app/widgets/az_progress_indicator.dart';
// import 'package:az_admin/core/theme/borders.dart';
// import 'package:az_admin/core/theme/colors.dart';
// import 'package:az_admin/core/theme/sizes/fields.dart';
// import 'package:az_admin/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scheduling_app/src/presentation/constants/app_borders.dart';
import 'package:scheduling_app/src/presentation/constants/app_constants.dart';
import 'package:scheduling_app/src/presentation/constants/app_styles.dart';

import '../constants/app_colors.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

///Campo de texto com as funções semelhantes ao TextFormField
///{@category Fields}
class ScInputText extends StatefulWidget {
  const ScInputText({
    Key? key,
    this.controller,
    this.focus,
    this.lines,
    this.nextFocus,
    this.onDone,
    this.type,
    this.action,
    this.hint,
    this.hintStyle,
    this.labelStyle,
    this.textStyle,
    this.suffix,
    this.suffixColor,
    this.suffixSize,
    this.onSuffix,
    this.inputBorder,
    this.inputBorderSelected,
    this.inputBorderError,
    this.onChange,
    this.autoFocus,
    this.onTap,
    this.validator,
    this.isSuffixIcon,
    this.obscure = false,
    this.hasFocusColor,
    this.noHasFocusColor = AppColors.primaryGrey,
    this.errorColor,
    this.errorStyle,
    this.label,
    this.inputFormatters = const [],
    this.disabled = false,
    this.capitalization = TextCapitalization.sentences,
    this.initialValue,
    this.onEditingComplete,
    this.enabled = true,
    this.maxLength,
    this.spaceBetweenLabelAndInput,
    this.cursorColor,
    this.minLines,
    this.backgroundColor,
    this.subtitle,
    this.spaceBetweenInputAndSubtitle,
    this.isLoading = false,
    this.buildCounter,
    this.counterStyle,
    this.counter,
    this.onEdittingUnFocus,
    this.labelSubtitle,
  }) : super(key: key);

  final double? spaceBetweenLabelAndInput;

  final double? spaceBetweenInputAndSubtitle;

  final String? subtitle;
  final String? labelSubtitle;

  ///Controller para manipulação do texto
  ///
  ///Evite usar o controller apenas para pegar o valor, para isso
  ///pode ser usado a função onChange
  final TextEditingController? controller;

  ///FocusNode para request
  final FocusNode? focus;

  ///FocusNode que será chamado após o onDone
  ///
  ///[focus] != null para acontecer
  ///a troca de cor entre [hasFocusColor] e [noHasFocusColor]
  final FocusNode? nextFocus;

  ///Cor da borda  e da label ativa
  ///[focus] != null para acontecer
  ///a troca de cor entre [hasFocusColor] e [noHasFocusColor]
  ///
  ///caso [hasFocusColor] == null
  ///a cor usada por padrão é [PsColors.primary]
  final Color? hasFocusColor;

  final Color? backgroundColor;

  ///Cor da borda  e da label desativada
  ///[focus] != null para acontecer
  ///a troca de cor entre [hasFocusColor] e [noHasFocusColor]
  ///
  ///caso [noHasFocusColor] == null
  ///a cor usada por padrão é [PsColors.primaryGrey]
  final Color? noHasFocusColor;

  ///cor da borda e da label caso aja erro
  ///caso o [validator] == null
  ///a cor não é habilitada
  ///
  ///a cor usada por padrão é [PsColors.error]
  final Color? errorColor;

  ///Função chamada quando clicado no botão de ação do teclado
  final Function? onDone;

  ///Esconde o texto digitado
  final bool? obscure;

  ///Tipo do teclado
  final TextInputType? type;

  ///Botão de ação do teclado
  final TextInputAction? action;

  ///Texto acima do campo
  final String? label;

  final TextStyle? labelStyle;

  final TextStyle? hintStyle;

  final TextStyle? errorStyle;

  final TextStyle? textStyle;

  final TextStyle? counterStyle;

  final Widget? counter;

  final bool? isSuffixIcon;
  final bool isLoading;

  ///Texto dentro do campo para dica
  final String? hint;

  ///Ícone ao final do campo
  final IconData? suffix;

  ///Tamanho do ícone
  final double? suffixSize;

  ///Função chamada ao clicar no ícone ao final do campo
  final Function? onSuffix;

  final Color? suffixColor;

  final InputBorder? inputBorder;

  final InputBorder? inputBorderSelected;

  final InputBorder? inputBorderError;

  ///Função chamada a cada alteração do texto do campo
  final ValueChanged<String>? onChange;

  ///Faz request do FocusScope quando inicia
  final bool? autoFocus;

  ///Máximo de linhas do campo
  ///
  ///Se nulo é definido 1
  final int? lines;

  final int? minLines;

  ///Função chamada quando clicado no campo
  final Function(String?)? onTap;

  ///Validador do campo
  final String? Function(String?)? validator;

  ///Formatador do campo
  final List<TextInputFormatter> inputFormatters;

  ///Desabilita o campo
  final bool disabled;

  ///Tipo de capitalização do campo
  final TextCapitalization capitalization;

  ///Valor inicial
  ///
  ///Não pode ser utilizado em conjunto ao [controller]
  final String? initialValue;

  ///Quando um [controlador] é especificado,
  ///[initialValue] deve ser nulo (o padrão).
  /// Se [controller] for nulo, então um [TextEditingController]
  /// será construído automaticamente e seu texto será
  ///  inicializado em [initialValue] ou na string vazia.
  final VoidCallback? onEditingComplete;

  final VoidCallback? onEdittingUnFocus;

  /// se o [ScInputText] vai ficar ativado
  final bool enabled;

  final int? maxLength;

  final Color? cursorColor;

  final InputCounterWidgetBuilder? buildCounter;

  @override
  _ScInputTextState createState() => _ScInputTextState();
}

class _ScInputTextState extends State<ScInputText> {
  Color? _color = AppColors.primary;
  String? validText;
  FocusNode? _focus;

  @override
  Widget build(BuildContext context) {
    final InputBorder _inputBorder =
        AppBorders.input.copyWithAll(color: _color).borderOutline;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            children: [
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: widget.label,
                    style: widget.labelStyle ??
                        TextStyle(
                          color: _inputBorder.borderSide.color,
                          fontSize: fieldHeight,
                        ),
                    children: <TextSpan>[
                      if (widget.labelSubtitle != null)
                        TextSpan(
                          text: widget.labelSubtitle,
                          style: AppStyles.small.copyWith(
                            color: Color(0xFF97A1A8),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        if (widget.label != null && widget.spaceBetweenLabelAndInput != null)
          SizedBox(height: widget.spaceBetweenLabelAndInput),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: widget.onTap != null
                      ? () => widget.onTap!(widget.label)
                      : null,
                  child: TextFormField(
                    maxLength: widget.maxLength,
                    readOnly: widget.disabled,
                    enabled: widget.enabled,
                    initialValue: widget.initialValue,
                    textCapitalization: widget.capitalization,
                    enableInteractiveSelection: !widget.disabled,
                    cursorColor: widget.cursorColor ?? Colors.grey[600],
                    focusNode: _focus,
                    controller: widget.controller,
                    onEditingComplete: widget.onEditingComplete,
                    inputFormatters: widget.inputFormatters,
                    autofocus: widget.autoFocus ?? false,
                    onChanged: widget.onChange,
                    onTap: () {
                      _focus = widget.focus ?? FocusNode();
                      // if (widget.onTap != null) widget.onTap!(widget.label);
                    },
                    style: widget.textStyle ??
                        Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: fieldHeight,
                              color: _color,
                            ),
                    onFieldSubmitted: (value) => widget.nextFocus != null
                        ? (FocusScope.of(context)
                            .requestFocus(widget.nextFocus))
                        : widget.onDone != null
                            ? widget.onDone!()
                            : null,
                    obscureText: widget.obscure ?? false,
                    keyboardType: widget.type,
                    minLines: widget.minLines,
                    textInputAction: widget.action,
                    maxLines: widget.lines ?? 1,
                    buildCounter: widget.buildCounter,
                    textAlign: TextAlign.left,
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: (value) {
                      String? result;

                      if (widget.validator != null) {
                        validText = widget.validator!(value);
                        Future.delayed(Duration.zero, () => _setColor());
                        result = validText;
                      }

                      return result;
                    },
                    decoration: InputDecoration(
                      errorMaxLines: 5,
                      hoverColor: Colors.transparent,
                      suffixIcon: getSufixIcon(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      // alignLabelWithHint: true,
                      counterStyle: widget.counterStyle,
                      counter: widget.counter,
                      hintText: widget.hint,
                      hintStyle: widget.hintStyle ??
                          TextStyle(
                              fontFamily: 'NunitoSans',
                              color: AppColors.placeholder),
                      border: widget.inputBorder ?? _inputBorder,
                      disabledBorder: widget.inputBorder ?? _inputBorder,
                      enabledBorder: widget.inputBorder ?? _inputBorder,
                      errorBorder: widget.inputBorderError ?? _inputBorder,
                      focusedBorder: widget.inputBorderSelected ?? _inputBorder,
                      focusedErrorBorder: _inputBorder,
                      errorStyle: widget.errorStyle ??
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                color: widget.errorColor ?? AppColors.error,
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (widget.subtitle != null) ...[
          SizedBox(
            height: widget.spaceBetweenInputAndSubtitle ?? 8,
          ),
          Text(
            widget.subtitle!,
            style: AppStyles.small.copyWith(
              color: Color(0xFF97A1A8),
            ),
          ),
        ]
      ],
    );
  }

  Widget? getSufixIcon() {
    if (widget.isLoading) {
      return Container(
        margin: EdgeInsets.only(right: 2, top: 4, bottom: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (validText != null) {
      // has error
      return Container(
        margin: EdgeInsets.only(right: 2, top: 4, bottom: 4),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Icon(
          PhosphorIcons.x_circle_fill,
          color: AppColors.error,
          size: 20,
        ),
      );
    }

    if (widget.suffix == null) return null;

    return Container(
      margin: EdgeInsets.only(right: 2, top: 4, bottom: 4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Material(
        color: Color(0xffffffff),
        // color: AppColors.primaryWhite.withOpacity(0),
        textStyle: AppStyles.paragraph,
        child: widget.isSuffixIcon != true
            ? InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.white,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () =>
                    widget.onSuffix != null ? widget.onSuffix!() : () {},
                child: Icon(
                  widget.suffix,
                  color: widget.suffixColor ?? _color,
                  size: widget.suffixSize ?? 12,
                ),
              )
            : Icon(
                widget.suffix,
                color: widget.suffixColor ?? _color,
                size: widget.suffixSize ?? 12,
              ),
      ),
    );
  }

  void _setColor() {
    if (mounted) {
      setState(() {
        if (validText != null) {
          _color = widget.errorColor ?? AppColors.error;
        } else if (_focus!.hasFocus) {
          _color = widget.hasFocusColor ?? AppColors.primary;
        } else {
          _color = widget.noHasFocusColor ?? AppColors.borderGray;
        }
      });
    }
  }

  void listenerFocus() {
    if (_focus != null) {
      _focus!.addListener(() {
        _setColor();

        if (!_focus!.hasFocus) {
          if (widget.onEdittingUnFocus != null) {
            widget.onEdittingUnFocus!();
          }
        }
      });
    }
  }

  @override
  void initState() {
    _color = widget.noHasFocusColor;
    _focus = widget.focus ?? FocusNode();
    listenerFocus();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScInputText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != widget) {
      _focus = widget.focus;
    }
  }

  @override
  void dispose() {
    if (mounted) {
      _focus?.removeListener(listenerFocus);
      _focus?.dispose();
      _focus = null;
    }
    super.dispose();
  }
}
