import 'package:flutter/material.dart';
import 'package:lis/src/modules/searcher/presentation/controllers/searcher_controller.dart';
import 'package:lis/src/modules/searcher/presentation/employee_chat_page.dart';
import 'package:lis/src/modules/searcher/presentation/employee_details_page.dart';
import 'package:lis/src/modules/searcher/presentation/widgets/searcher_form_field.dart';
import 'package:lis/src/modules/searcher/presentation/widgets/team_button.dart';

import 'employers_search_page.dart';

class SearcherPage extends StatefulWidget {
  const SearcherPage({super.key, required this.controller});

  final SearcherController controller;

  @override
  State<SearcherPage> createState() => _SearcherPageState();
}

class _SearcherPageState extends State<SearcherPage> {
  @override
  void dispose() {
    widget.controller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> filters = ['Documentos', 'Cargas', 'Coletas'];
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 88),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: LayoutBuilder(
        builder: (context, constraint) => Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                height: constraint.maxHeight - 40,
                width: constraint.maxWidth,
                child: Container(
                  color: const Color(0x3A3EAF1C),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        height: constraint.maxHeight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(height: 16),
                            ValueListenableBuilder(
                                valueListenable: widget.controller.selectedPage,
                                builder: (context, page, _) {
                                  return page != SelectedPage.searcher
                                      ? BackButton(onPressed: () {
                                          widget.controller.changePage(
                                            page == SelectedPage.details ? SelectedPage.searcher : SelectedPage.details,
                                          );
                                        })
                                      : const SizedBox();
                                }),
                            const Expanded(child: SizedBox()),
                            TeamButton(onTap: () {}),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 16, left: 16, right: 16),
                          child: ValueListenableBuilder(
                              valueListenable: widget.controller.selectedPage,
                              builder: (context, page, _) {
                                return page == SelectedPage.searcher
                                    ? EmployersSearchPage(
                                        filters: filters,
                                        controller: widget.controller,
                                        constraint: constraint,
                                      )
                                    : page == SelectedPage.details
                                        ? EmployeeDetailsPage(
                                            controller: widget.controller,
                                            constraint: constraint,
                                          )
                                        : EmployeeChatPage(
                                            controller: widget.controller,
                                            constraint: constraint,
                                          );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.76, -0.95),
              child: SearcherFormField(
                controller: widget.controller.searcherController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
