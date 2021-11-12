/* Home Page Editing Enabler - Enable Page Editing on iPadOS
 * Copyright (C) 2021 Tomasz Poliszuk
 *
 * Home Page Editing Enabler is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * Home Page Editing Enabler is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Home Page Editing Enabler. If not, see <https://www.gnu.org/licenses/>.
 */


@interface SBIconListPageControl : UIPageControl
@property (nonatomic) bool actsAsButton;
@end

@interface SBNestingViewController : UIViewController
@end

@interface SBFolderController : SBNestingViewController
@property (nonatomic, retain) SBIconListPageControl *pageControl;
@end

@interface SBRootFolderController : SBFolderController
@end

%hook SBRootFolderController
- (bool)isEditing {
	bool origValue = %orig;
	[[self pageControl] setActsAsButton:origValue];
	return origValue;
}
%end
