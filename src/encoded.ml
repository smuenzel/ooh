(* SPDX-FileCopyrightText: Copyright (C) 2025 Stefan Muenzel
 * SPDX-License-Identifier: MPL-2.0
 *)

type 'v t = int [@@immediate]

module Int61_high_bits = struct
  type value = int
  
  let unchecked_encode (x : value) : value t = x

  let encode_exn (x : value) : value t =
    if x land 0b11 <> 0 then raise (Invalid_argument "x land 0b11 <> 0") else x

  let decode (x : value t) : value = x
end

module Raw = struct
  let to_int (x : _ t) : int = x
end

module Private = struct
  let unsafe_create (x : _ t) : _ t = x
end
