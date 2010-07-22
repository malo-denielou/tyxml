open XML

module type Info = 
sig
  val emptytags : string list
  val blocktags : string list
  val semiblocktags : string list
  type +'a elt
  type doctypes
  val default_doctype : doctypes
  val doctype : doctypes -> string
  val toeltl : 'a elt list -> XML.elt list
  val toelt : 'a elt -> XML.elt
  val ocsigenadv: string
  val need_name : string list
 end

module Xhtml5Info = struct
  include XHTML5.M
  let default_doctype = `XHTML_05_00
  let ocsigenadv =
    "<!-- Page generated by OCaml with Ocsigen.
See http://www.ocsigen.org and http://caml.inria.fr for information -->\n"
(* The following tags are written <br />, etc.
   The other empty tags are written <p></p> for html compatibility.
   See guidelines here:
   http://www.w3.org/TR/xhtml1/#guidelines
 *)
  let emptytags = (*["hr"; "br"; "img"; "meta"; "link"; "input";
                    "col"; "area"; "param"; "base"; "basefont";
                    "isindex"; "frame"]*)
    ["area"; "base"; "br"; "col"; "command"; "embed" ;"hr"; "img";
     "input"; "keygen"; "link"; "meta"; "param"; "source"; "wbr"]
               
  let blocktags = [ "fieldset"; "form"; "address"; "body"; "head";
                    "blockquote"; "div"; "html";
                    "h1"; "h2"; "h3"; "h4"; "h5"; "h6";
                    "p"; "dd"; "dl"; "li"; "ol"; "ul";
                    "colgroup"; "table"; "tbody"; "tfoot"; "thead";
                    "td"; "th"; "tr" ]

  let need_name = ["a"; "applet"; "form"; "frame"; "iframe"; "img"; "map"]
  let semiblocktags = (*[ "pre"; "style"; "title" ]*)
    [ "iframe"; "option"; "script";"textarea"; "title" ]
end
module XhtmlInfo = struct
  include XHTML.M
  let ocsigenadv =
    "<!-- Page generated by OCaml with Ocsigen.
See http://www.ocsigen.org and http://caml.inria.fr for information -->\n"
  let default_doctype = `XHTML_01_01
  let doctype = XHTML.M.doctype
  let emptytags = ["hr"; "br"; "img"; "meta"; "link"; "input";
                  "col"; "area"; "param"; "base"; "basefont";
                  "isindex"; "frame"]
  let blocktags = [ "fieldset"; "form"; "address"; "body"; "head";
                    "blockquote"; "div"; "html";
                    "h1"; "h2"; "h3"; "h4"; "h5"; "h6";
                    "p"; "dd"; "dl"; "li"; "ol"; "ul";
                    "colgroup"; "table"; "tbody"; "tfoot"; "thead";
                    "td"; "th"; "tr" ]
  let semiblocktags = [ "pre"; "style"; "title" ]
    
 (* as per XHTML 1.0, appendix C.8; name attr deprecated in 1.1 *)
  let need_name = ["a"; "applet"; "form"; "frame"; "iframe"; "img"; "map"]
 

end
