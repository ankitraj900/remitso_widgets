import 'package:flutter/material.dart';
import '../theme/remitso_theme.dart';

class RemitsoDropdownButton<T> extends StatelessWidget {
  final String? label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String? hint;
  final Widget? prefixIcon;

  const RemitsoDropdownButton({
    super.key,
    this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              label!,
              style: RemitsoTextStyle.inputText,
            ),
          ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: RemitsoColors.primary.withOpacity(0.3),
            ),
            color: Colors.grey[50],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value,
              items: items.map((item) => DropdownMenuItem<T>(
                value: item.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 52),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: RemitsoColors.primary.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (prefixIcon != null) ...[
                              prefixIcon!,
                              const SizedBox(width: 16),
                            ],
                            Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: item.child,
                            ),
                          ],
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: item.value == value 
                                ? RemitsoColors.primary
                                : Colors.transparent,
                            border: Border.all(
                              color: RemitsoColors.primary,
                              width: 1.5,
                            ),
                          ),
                          child: item.value == value
                            ? const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                        ),
                      ],
                    ),
                  ),
                ),
              )).toList(),
              onChanged: onChanged,
              hint: hint != null 
                ? Row(
                    children: [
                      if (prefixIcon != null) ...[
                        prefixIcon!,
                        const SizedBox(width: 12),
                      ],
                      Text(hint!, style: RemitsoTextStyle.inputText),
                    ],
                  ) 
                : null,
              isExpanded: true,
              icon: Icon(
                Icons.arrow_drop_down,
                color: RemitsoColors.primary,
              ),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              style: RemitsoTextStyle.inputText.copyWith(
                color: RemitsoColors.black87,
              ),
              selectedItemBuilder: (context) => items.map((item) => 
                Row(
                  children: [
                    if (prefixIcon != null) ...[
                      prefixIcon!,
                      const SizedBox(width: 12),
                    ],
                    Expanded(child: item.child),
                  ],
                ),
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
} 