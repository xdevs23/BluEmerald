package org.xdevs23.ui.dialog.templates;

import android.content.DialogInterface;

public class DismissDialogButton implements DialogInterface.OnClickListener {
	
	@Override
	public void onClick(DialogInterface dialog, int id) {
		dialog.dismiss();
	}
	
}
