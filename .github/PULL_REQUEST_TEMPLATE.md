## 🎯 Purpose of This PR

Briefly describe the goal of this PR. Is it a feature, fix, refactor, or documentation update? Please also include relevant motivation and context.

## 🔗 Related Discussion or Issue

Reference any relevant GitHub Discussions or Issues:
- Discussion(s): #[#discussion-number]
- Issue(s): #[issue-number]

## 🧩 Summary of Changes

List the key changes made in this PR. For example:
- Updated ASM routines related to battle logic
- Refactored map data structures for better readability
- Renamed data files for consistency

## 🔄 Coordination Notes

Explain any dependencies or coordination needed between the [SF2DISASM](https://github.com/ShiningForceCentral/SF2DISASM) and [SF2JavaToolSuite](https://github.com/ShiningForceCentral/SF2JavaToolSuite) projects:
- Requires the ability to parse data files presented in the ASM format to be implemented
- Changes to enums need to be accounted for
- Default file paths need to be updated

## 🧪 How Has This Been Tested?

Please confirm that the following standard tests have been performed. Then, list any additional tests that you ran to verify your changes and provide instructions so we can reproduce them. 
- [ ] Run build.bat and confirm that it produces a bit-perfect replica of original rom
- [ ] Run buildstandard.bat or buildexpanded.bat, if applicable, and confirm that build succeeds
- [ ] Open MapEditor, load map63 and export then import again (confirm that data exports without issue and import as-it-was)
- [ ] Open BattleSpriteEditor and load a character then export as pngs then import pngs back in (confirm that image import/export works without issue)
- [ ] Open BattleEditor, load a battle (battle00) (This one uses SF2Enums heavily so this is a good test that it can read all of this)

## ✅ Checklist

- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings

## 📚 Additional Notes

Any other context, screenshots, or edge cases reviewers should be aware of?
