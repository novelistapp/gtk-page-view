// This is a widget example with Vala
//


using Gtk;

/* This is our application */
public class MyApplication : Gtk.Application {
	protected override void activate () {
		new MyWindow (this).show_all ();
	}
}

class CustomBuffer: Gtk.TextBuffer {
    
}

class CustomText: Gtk.TextView {

}

/* We're using Windows™ */
class MyWindow: Gtk.ApplicationWindow {

    void insert_text(ref TextIter pos, string new_text, int new_text_length) {

    }

	internal MyWindow (MyApplication app) {
		Object (application: app, title: "TextView Example");
		this.set_default_size (220, 200);

        var buffer = new Gtk.TextBuffer(null); //stores text to be displayed
        buffer.set_text("This is an example!\0", -1);
        var tag = buffer.create_tag("default", "font", "Inconsolata 14");

        TextIter start, stop;
        buffer.get_bounds(out start, out stop);
        buffer.apply_tag(tag, start, stop);

		var textview = new Gtk.TextView.with_buffer(buffer); //displays TextBuffer
		textview.set_wrap_mode(Gtk.WrapMode.WORD); //sets line wrapping

		var scrolled_window = new Gtk.ScrolledWindow(null, null);
		scrolled_window.set_policy(Gtk.PolicyType.AUTOMATIC,
		                           Gtk.PolicyType.AUTOMATIC);

		scrolled_window.add(textview);
		scrolled_window.set_border_width(5);

		this.add(scrolled_window);
	}
}

class PageView: Gtk.TextView {
	internal PageView() {

	}
}

/* main creates and runs the application. */
public int main (string[] args) {
	return new MyApplication ().run (args);
}
